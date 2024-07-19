using CloudNative.CloudEvents;
using CloudNative.CloudEvents.SystemTextJson;
using System.Diagnostics.CodeAnalysis;
using System.Text.Json;

namespace PubsubExplorer.Components.Pages.PublishMessages;

public sealed class PublisherViewModel : TopicSelectionModel
{
    private static readonly JsonSerializerOptions _serializerOptions
        = new() { WriteIndented = true };

    public string? Message { get; set; }

    public List<string> Attributes { get; set; } = [];

    public int PostCount { get; set; } = 1;

    [MemberNotNullWhen(true, nameof(Message))]
    public bool CanPost => 
        !string.IsNullOrWhiteSpace(SelectedTopic)
        && CanUsePublisherApi;

    public PublisherViewModel()
    {                
        var cloudEvent = new CloudEvent(CloudEventsSpecVersion.V1_0)
        {
            Id = Guid.NewGuid().ToString(),
            Source = new Uri($"urn:petsmart:devops:pubsub-explorer-app/{Environment.MachineName}"),
            Type = "com.petsmart.devops.fake.event.v1",
            Subject = Guid.NewGuid().ToString(),
            Time = DateTimeOffset.UtcNow,
            DataContentType = "application/json",
            Data = new object()
        };

        var formatter = new JsonEventFormatter();
        var defaultMessage = formatter.EncodeStructuredModeMessage(cloudEvent, out _);        
        var tmp = JsonSerializer.Deserialize<object>(defaultMessage.ToArray());
        Message = JsonSerializer.Serialize(tmp, _serializerOptions);
    }
}
