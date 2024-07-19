namespace PubsubExplorer.Components;

public interface IBrowsablePubsub
{
    List<MessageViewModel> FilteredMessagePage { get; }
    
    MessageViewModel? SelectedMessage { get; set; }
}
