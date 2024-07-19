using System.Text.Json;
using System.Text.RegularExpressions;
using Google.Cloud.PubSub.V1;

namespace PubsubExplorer.Components;

public partial class MessageViewModel
{
    private static readonly JsonSerializerOptions SerializerOptions = new () { WriteIndented = true };
    
    public bool Bookmarked { get; set; }

    public string? Id { get; set; }

    public DateTimeOffset? Timestamp { get; set; }

    public string TimestampText => Timestamp.HasValue
        ? Timestamp.Value.ToString("O")
        : "No timestamp";

    public string? Type { get; set; }
    
    public string? AckId { get; set; }
    
    public DateTimeOffset LeaseExpiration { get; private set; }
    
    public Dictionary<string, string> Headers { get; set; } = [];
    
    public Dictionary<string, object?> MessageProperties => JsonUtil.Flatten(MessageJson ?? string.Empty);

    public bool HasErrors => MessageProperties.TryGetValue("errordetails", out _);
    
    public  int RemainingLeaseSeconds { get; private set; }
    
    public string RemainingLeaseMessage => RemainingLeaseSeconds == 0 ? "Expired!" : $"Lease expires in {RemainingLeaseSeconds}";

    public string? ErrorBadgeData => HasErrors ? "!" : null;
    
    public string? MessageJson { get; set; } 

    public string? ReturnTo { get; set; }

    public bool CanReplay => !string.IsNullOrWhiteSpace(ReturnTo) 
        && RemainingLeaseSeconds > 0
        && TopicName.TryParse(ReturnTo, out _);

    public string ItemText => Type ?? Id ?? "Unknown";
        

    public string GetErrors()
    {
        if (!MessageProperties.TryGetValue("errordetails", out var errorDetails))
            return string.Empty;

        var errorMessage = errorDetails!.ToString()!;
        var reformatted = SpaceTabPattern().Replace(errorMessage, "\n$0");
        return reformatted;
    }
    
    public static MessageViewModel FromPubsub(PubsubMessage message, string? ackId, DateTimeOffset expiresAt)
    {
        var rawJson = message.Data.ToStringUtf8();
        var deserialized = JsonDocument.Parse(rawJson);
        var formatted = JsonSerializer.Serialize(deserialized, SerializerOptions);

        var hasType = deserialized.RootElement.TryGetProperty("type", out var typeProp);
        var hasReturnAddress = deserialized.RootElement.TryGetProperty("returnto", out var returnProp);
        var hasTimestamp = deserialized.RootElement.TryGetProperty("time", out var timestamp);

        var model = new MessageViewModel
        {
            Message = message,
            MessageJson = formatted,
            Headers = message.Attributes.ToDictionary(),
            Id = message.MessageId,
            Type = hasType ? typeProp.GetString() : null,
            Timestamp = hasTimestamp ? timestamp.GetDateTimeOffset() : null,
            AckId = ackId,
            LeaseExpiration = expiresAt,
            ReturnTo = hasReturnAddress ? returnProp.GetString() : string.Empty
        };

        return model;
    }

    public PubsubMessage Message { get; set; } = default!;

    public void SetExpiration(DateTimeOffset expiration)
    {
        LeaseExpiration = expiration;
    }

    public void UpdateLeaseCountdown()
    {
        RemainingLeaseSeconds = (int) (LeaseExpiration - DateTimeOffset.UtcNow).TotalSeconds;
        if (RemainingLeaseSeconds < 0)
            RemainingLeaseSeconds = 0;
    }
    
    [GeneratedRegex(" {3,}")]
    private static partial Regex SpaceTabPattern();
}