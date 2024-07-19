using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.Logging;
using MudBlazor;
using PubsubExplorer.Components.Layout;

namespace PubsubExplorer.Components.Pages;

internal class LoadingHandle(Action disposeAction) : IDisposable
{
    private readonly Action _disposeAction = disposeAction;

    public void Dispose()
    {
        _disposeAction();
    }
}

public class PageBase : ComponentBase, IDisposable
{
    private readonly List<string> _activities = [];
    private readonly List<string> _loadingStatuses = [];

    [Inject]
    protected IPageLoadingControl PageLoadingControl { get; set; } = default!;

    [Inject]
    protected IDialogService DialogService { get; set; } = default!;

    [Inject]
    protected ISnackbar Snackbar { get; set; } = default!;

    public string? LoadingStatus => _loadingStatuses.LastOrDefault();

    public bool IsLoading => _activities.Count != 0;

    // BUG: this doesn't always work for some reason
    protected async Task<IDisposable> StartLoading(string? status = null)
    {
        if (status != null)
            _loadingStatuses.Add(status);

        var key = PageLoadingControl.Start();
        _activities.Add(key);

        await InvokeAsync(StateHasChanged);

        return new LoadingHandle(() =>
        {
            PageLoadingControl.Stop(key);
            _activities.Remove(key);

            if (status is not null)
                _loadingStatuses.Remove(status);
        });
    }

    protected async Task<bool> Try(Func<Task> operation, string? errorMessage = null)
    {
        try
        {
            await operation();
            return true;
        }
        catch(Exception e)
        {
            var message = errorMessage ?? e.Message;
            Snackbar.Add(message, Severity.Error);
            return false;
        }
    }

    public virtual void Dispose()
    {
        GC.SuppressFinalize(this);
        foreach (var activity in _activities)
        {
            PageLoadingControl.Stop(activity);
        }
    }
}