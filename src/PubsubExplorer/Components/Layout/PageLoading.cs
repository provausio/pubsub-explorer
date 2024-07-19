using System.Collections.Concurrent;
using System.Runtime.CompilerServices;

namespace PubsubExplorer.Components.Layout;

public interface IPageLoadingControl
{
    event EventHandler? OnChange;
    bool HasActivity { get; }

    string Start();

    void Stop(string key);
}

public class PageLoadingControl : IPageLoadingControl
{
    private readonly ConcurrentDictionary<string, bool> _activities = [];
    public event EventHandler? OnChange;

    public bool HasActivity => !_activities.IsEmpty;

    public string Start()
    {
        var key = Guid.NewGuid().ToString("N");
        _activities.TryAdd(key, true);
        OnChange?.Invoke(this, new PageLoaderUpdatedEventArgs(key));
        return key;
    }

    public void Stop(string key)
    {
        _activities.TryRemove(key, out _);
        OnChange?.Invoke(this, new PageLoaderUpdatedEventArgs(key));
    }
}

public class PageLoaderUpdatedEventArgs(string key) : EventArgs
{
    public string ActivityKey { get; set; } = key;
}