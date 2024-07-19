using Google.Api.Gax;
using Google.Api.Gax.ResourceNames;
using Google.Cloud.PubSub.V1;
using Google.Protobuf;
using Google.Protobuf.WellKnownTypes;

namespace PubsubExplorer.Infrastructure.Google.PubSub;

public class PubSub
{    
    private readonly PublisherServiceApiClient _publisherApiClient = PublisherServiceApiClient.Create();
    private readonly SubscriberServiceApiClient _subscriberApiClient = SubscriberServiceApiClient.Create();

    public async Task<(IReadOnlyCollection<TopicName> Topics, string PageToken)?> ListTopics(
        string projectId,
        int pageSize,
        string? pageToken = null)
    {        
        try
        {
            var projectName = ProjectName.FromProject(projectId);
            var topics = _publisherApiClient.ListTopicsAsync(projectName, pageToken, pageSize);
            var page = await topics.ReadPageAsync(pageSize);
            var topicNames = page
                .Select(topic => topic.TopicName)
                .ToList();

            return (topicNames, page.NextPageToken);
        }
        catch
        {
            return default;
        }
    }

    public async Task<IEnumerable<SubscriptionName>> GetTopicSubscriptions(
        string projectId, 
        string topicId)
    {
        try
        {
            var topicName = TopicName.FromProjectTopic(projectId, topicId);
            var response = _publisherApiClient.ListTopicSubscriptionsAsync(topicName);
            var subscriptionNames = new List<string>();
            await foreach (var subscription in response)
            {
                subscriptionNames.Add(subscription);
            }

            return subscriptionNames.Select(SubscriptionName.Parse);
        }
        catch (Exception ex)
        {
            return [];
        }
    }

    public async Task<IEnumerable<(PubsubMessage Message, string AckId, DateTimeOffset LeaseExpires)>> PullMessages(
        string projectId,
        string subscriptionId, 
        int count,
        int? setLease = null)
    {
        var shouldModifyDeadline = setLease.HasValue && setLease.Value > 0;
        var subscriptionName = SubscriptionName.FromProjectSubscription(
            projectId, 
            subscriptionId);

        var subscription = _subscriberApiClient.GetSubscription(subscriptionName);        

        var pullRequest = new PullRequest
        {
            SubscriptionAsSubscriptionName = subscriptionName,
            MaxMessages = count
        };

        var response = await _subscriberApiClient.PullAsync(pullRequest);        

        if(shouldModifyDeadline)
        {            
            var ackIds = response.ReceivedMessages.Select(m => m.AckId);
            await _subscriberApiClient.ModifyAckDeadlineAsync(
                subscriptionName,
                ackIds,
                setLease!.Value);
        }

        var uiAckDeadline = shouldModifyDeadline
            ? DateTimeOffset.UtcNow.AddSeconds(setLease!.Value)
            : DateTimeOffset.UtcNow.AddSeconds(subscription.AckDeadlineSeconds);

        return response.ReceivedMessages.Select(m => (
            m.Message,
            m.AckId,
            uiAckDeadline
        ));
    }

    public async Task AcknowledgeMessages(
        string projectId,
        string subscriptionId, 
        IEnumerable<string?> ackIds)
    {
        var nonNullIds = ackIds.Where(id => !string.IsNullOrEmpty(id));
        var subscriptionName = SubscriptionName.FromProjectSubscription(projectId, subscriptionId);        
        await _subscriberApiClient.AcknowledgeAsync(subscriptionName, nonNullIds);
    }

    public async Task ModifyDeadline(
        string projectId,
        string subscriptionId, 
        IEnumerable<string?> ackIds, 
        int newDeadline)
    {
        if (newDeadline < 0)
            newDeadline = 0;

        var nonNullIds = ackIds.Where(id => !string.IsNullOrEmpty(id));
        var subscriptionName = SubscriptionName.FromProjectSubscription(projectId, subscriptionId);
        await _subscriberApiClient.ModifyAckDeadlineAsync(
                subscriptionName,
                nonNullIds,
                newDeadline);
    }

    public async Task NackMessages(
        string projectId,
        string subscriptionId, 
        IEnumerable<string?> messageAckIds)
    {
        try
        {
            var nonNullIds = messageAckIds.Where(m => !string.IsNullOrWhiteSpace(m));

            var subscriptionName = SubscriptionName.FromProjectSubscription(projectId, subscriptionId);
            var subscriberService = await SubscriberServiceApiClient.CreateAsync();
            await subscriberService.ModifyAckDeadlineAsync(subscriptionName, nonNullIds, 0);
        }
        catch { }
    }

    public async Task PublishMessage(
        PubsubMessage message, 
        string originTopic)
    {
        if (!TopicName.TryParse(originTopic, out var topicName))
            throw new ArgumentException($"{originTopic} is not a valid pubsub topic name", nameof(originTopic));

        await PublishMessages(
            message.Data.ToStringUtf8(),
            message.Attributes.ToDictionary(),
            topicName.ProjectId,
            topicName.TopicId);
    }

    public async Task PublishMessages(
        string messageString,
        Dictionary<string, string> attributes,
        string destinationProject, 
        string destinationTopic,
        int repeat = 1)
    {
        var topicName = TopicName.FromProjectTopic(destinationProject, destinationTopic);
        var messages = Enumerable.Range(0, repeat)
            .Select(_ => new PubsubMessage
            {
                Data = ByteString.CopyFromUtf8(messageString),
                Attributes = { attributes }
            });

        await _publisherApiClient.PublishAsync(topicName, messages);
    }

    public async Task<SubscriberClient> GetSubscriberClient(
        string projectId, 
        string subscriptionId)
    {
        var subscriptionName = SubscriptionName.FromProjectSubscription(projectId, subscriptionId);
        var subscriberClientBuilder = new SubscriberClientBuilder
        {
            // this is a debugging tool so keep it simple
            SubscriptionName = subscriptionName,
            ClientCount = 1,
            Settings = new SubscriberClient.Settings
            {                
                FlowControlSettings = new FlowControlSettings(1, null),                
            }
        };

        return await subscriberClientBuilder.BuildAsync();
    }

    public async Task<Subscription> CreateTempSubscription(
        string projectId,
        string topicId,
        string subscriptionId)
    {
        var subscription = new Subscription
        {
            TopicAsTopicName = TopicName.FromProjectTopic(projectId, topicId),
            SubscriptionName = SubscriptionName.FromProjectSubscription(projectId, subscriptionId),
            ExpirationPolicy = new ExpirationPolicy
            {
                Ttl = Duration.FromTimeSpan(TimeSpan.FromDays(1))
            }
        };

        var newSubscription = await _subscriberApiClient.CreateSubscriptionAsync(subscription);
        return newSubscription;
    }
}