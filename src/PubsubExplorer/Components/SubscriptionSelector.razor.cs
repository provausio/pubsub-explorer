using System.Diagnostics.CodeAnalysis;

namespace PubsubExplorer.Components;



public class SubscriptionSelectionModel : TopicSelectionModel
{
    public override string? SelectedProject { get; set; } = "petm-prj-jstafforddojo-dj-rofl";

    public override string? SelectedTopic { get; set; }

    public string? SelectedSubscription { get; set; }

    public virtual List<string> AvailableSubscriptions { get; set; } = [];

    [MemberNotNullWhen(true, nameof(SelectedProject))]
    public override bool CanLoadTopics =>
        !string.IsNullOrWhiteSpace(SelectedProject);

    [MemberNotNullWhen(true,
        nameof(SelectedProject),
        nameof(SelectedTopic))]
    public override bool CanUsePublisherApi =>
        CanLoadTopics
        && !string.IsNullOrWhiteSpace(SelectedTopic);

    [MemberNotNullWhen(true,
        nameof(SelectedProject),
        nameof(SelectedTopic),
        nameof(SelectedSubscription))]
    public bool CanUseSubscriptionApi =>
        CanUsePublisherApi
        && !string.IsNullOrWhiteSpace(SelectedSubscription);
}
