using PubsubExplorer.Utilities;
using System.Text.RegularExpressions;

namespace PubsubExplorer.Components.Pages.TailSubscription;

public sealed partial class TailSubscriptionViewModel : SubscriptionSelectionModel, IBrowsablePubsub
{
    private readonly JsonSearchManager _searchManager = new();
    private readonly object _lock = new();

    public List<MessageViewModel> MessagePage { get; private set; } = [];

    public int MessageBufferSize { get; set; } = 20;

    public bool IsListening { get; set; }

    public string TempSubscriptionName { get; private set; }

    private List<MessageViewModel> _filteredMessages = [];
    public List<MessageViewModel> FilteredMessagePage 
    { 
        get
        {
            lock(_lock)
            {
                FilterMessages();
                return _filteredMessages;
            }
        }         
    }

    public bool BufferIsFull => FilteredMessagePage.Count >= MessageBufferSize;

    public string? JsonPathFilter { get; set; }

    public MessageViewModel? SelectedMessage { get; set; }

    private List<string> _availableSubscriptions = [];
    public override List<string> AvailableSubscriptions
    {
        get => WithTempSubAtTop(_availableSubscriptions);
        set { _availableSubscriptions = value; }
    }

    public TailSubscriptionViewModel()
    {
        TempSubscriptionName = $"tmp.{AlphaWithHyphensPattern().Replace(Environment.UserName, "-")}-sub".ToLower();
    }

    private void FilterMessages()
    {
        if (string.IsNullOrWhiteSpace(JsonPathFilter))
        {
            _filteredMessages = MessagePage;
            return;
        }

        var matchingIds = _searchManager.GetMatchingIds(JsonPathFilter);
        _filteredMessages = MessagePage
            .Where(m => matchingIds.Contains(m.Message.MessageId))
            .ToList();
    }

    private List<string> WithTempSubAtTop(List<string> subs)
    {
        if (!subs.Any(s => s.Equals(TempSubscriptionName)))
            return subs;

        var tempSub = subs.Remove(TempSubscriptionName);
        subs.Insert(0, TempSubscriptionName);

        return subs;
    }

    public void PushMessage(MessageViewModel message)
    {
        if (MessagePage.Any(m => m.Id == message.Id))
            return;

        if(MessagePage.Count < MessageBufferSize)
            MessagePage.Add(message);
    }

    [GeneratedRegex("[^a-zA-Z-]")]
    private static partial Regex AlphaWithHyphensPattern();
}
