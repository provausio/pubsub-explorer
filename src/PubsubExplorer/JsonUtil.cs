using System.Text.Json.Nodes;

namespace PubsubExplorer;

public static class JsonUtil
{
    public static Dictionary<string, object?> Flatten(string json)
    {
        var result = new Dictionary<string, object?>();
        if (JsonNode.Parse(json) is not JsonObject jObj)
            return result;

        FlattenJsonObject(jObj, result, string.Empty);
        return result;
    }

    private static void FlattenJsonObject(JsonObject jsonObj, Dictionary<string, object?> result, string prefix)
    {
        foreach (var kvp in jsonObj)
        {
            var propertyPrefix = string.IsNullOrEmpty(prefix)
                ? kvp.Key
                : $"{prefix}.{kvp.Key}";

            switch (kvp.Value)
            {
                case JsonObject nestedObject:
                    FlattenJsonObject(nestedObject, result, propertyPrefix);
                    break;
                case JsonArray array:
                    FlattenJsonArray(array, result, propertyPrefix);
                    break;
                default:
                    result[propertyPrefix] = kvp.Value?.ToString();
                    break;
            }
        }
    }

    private static void FlattenJsonArray(JsonArray array, Dictionary<string, object?> dictionary, string prefix)
    {
        for (var i = 0; i < array.Count; i++)
        {
            var item = array[i];
            var itemPrefix = $"{prefix}[{i}]";

            switch (item)
            {
                case JsonObject nestedObject:
                    FlattenJsonObject(nestedObject, dictionary, itemPrefix);
                    break;
                case JsonArray nestedArray:
                    FlattenJsonArray(nestedArray, dictionary, itemPrefix);
                    break;
                default:
                    dictionary[itemPrefix] = item?.ToString();
                    break;
            }
        }
    }
}