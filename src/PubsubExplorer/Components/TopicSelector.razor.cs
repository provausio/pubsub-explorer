using System.Diagnostics.CodeAnalysis;

namespace PubsubExplorer.Components;

public class TopicSelectionModel
{
    public virtual string? SelectedProject { get; set; } = "petm-prj-jstafforddojo-dj-rofl";

    public virtual string? SelectedTopic { get; set; }

    public List<string> AvailableTopics { get; set; } = [];

    [MemberNotNullWhen(true, nameof(SelectedProject))]
    public virtual bool CanLoadTopics =>
        !string.IsNullOrWhiteSpace(SelectedProject);

    [MemberNotNullWhen(true,
        nameof(SelectedProject),
        nameof(SelectedTopic))]
    public virtual bool CanUsePublisherApi =>
        CanLoadTopics
        && !string.IsNullOrWhiteSpace(SelectedTopic);
}