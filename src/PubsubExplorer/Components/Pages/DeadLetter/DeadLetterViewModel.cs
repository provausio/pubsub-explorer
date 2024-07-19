using PubsubExplorer.Utilities;
using System.Diagnostics.CodeAnalysis;

namespace PubsubExplorer.Components.Pages.DeadLetter;

public sealed class DeadLetterViewModel : SubscriptionSelectionModel, IBrowsablePubsub
{
    private readonly JsonSearchManager _searchManager = new();

    public string? SelectedMessageId { get; set; }

    public MessageViewModel? SelectedMessage { get; set; }

    public bool MessageSelected => SelectedMessage != null;

    public List<MessageViewModel> MessagePage { get; private set; } = [];

    public List<MessageViewModel> FilteredMessagePage { get; set; } = [];

    public bool HasSelection => MessagePage.Any(m => m.Bookmarked);

    public int LeaseDurationSeconds { get; set; }

    public int MessagePullCount { get; set; } = 30;

    public string? JsonPathFilter { get; set; }

    public IEnumerable<MessageOptions> Options { get; set; } = [MessageOptions.RequireConfirmations];

    //public MessageViewModel? SelectedMessage => GetSelectedMessage();

    public IEnumerable<MessageViewModel> BookmarkedMessages
        => MessagePage.Where(m => m.Bookmarked);

    public MessageViewModel? GetSelectedMessage()
        => MessagePage.SingleOrDefault(m => m.Id == SelectedMessageId);


    public void SetMessagePage(ICollection<MessageViewModel> messages)
    {
        MessagePage = [.. messages];
        FilteredMessagePage = MessagePage;
        _searchManager.Index(messages.Select(m => m.Message));
    }

    public void FilterMessages()
    {
        if (string.IsNullOrWhiteSpace(JsonPathFilter))
        {
            FilteredMessagePage = MessagePage;
            return;
        }

        var matchingIds = _searchManager.GetMatchingIds(JsonPathFilter);
        FilteredMessagePage = MessagePage
            .Where(m => matchingIds.Contains(m.Message.MessageId))
            .ToList();
    }
}

public enum MessageOptions
{
    AutoRenewLease,
    RequireConfirmations
}