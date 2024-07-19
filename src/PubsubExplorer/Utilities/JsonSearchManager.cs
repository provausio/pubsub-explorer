using System.Text.Json.Nodes;
using Google.Cloud.PubSub.V1;
using Json.Path;

namespace PubsubExplorer.Utilities;

internal sealed record MessageIndexItem(string Id, JsonNode Node, PubsubMessage Message);

internal sealed class JsonSearchManager
{
    private readonly List<MessageIndexItem> _index = [];

    public void Index(IEnumerable<PubsubMessage> messages)
    {
        _index.Clear();
        foreach (var message in messages)
        {
            var jsonNode = JsonNode.Parse(message.Data.ToStringUtf8());
            if (jsonNode is null)
                continue;

            _index.Add(new MessageIndexItem(message.MessageId, jsonNode, message));
        }
    }

    public IEnumerable<string> GetMatchingIds(string jsonPath)
        => Match(jsonPath).Select(m => m.Id);

    public IEnumerable<MessageIndexItem> Match(string jsonPath)
    {
        if (!JsonPath.TryParse(jsonPath, out var path))
            return [];

        var matches = _index
            .Select(t => new
            {
                t,
                pathResult = path.Evaluate(t.Node)
            })
            .Where(t => t.pathResult.Matches.Count != 0)
            .ToList();

        return matches.Select(m => m.t);
    }
}