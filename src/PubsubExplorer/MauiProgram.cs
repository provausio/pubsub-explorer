using Microsoft.Extensions.Logging;
using MudBlazor.Services;
using MudExtensions.Services;
using PubsubExplorer.Components.Layout;

namespace PubsubExplorer;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();


        builder.Services.AddMudServices();
        builder.Services.AddMudExtensions();
        builder.Services.AddSingleton<IPageLoadingControl, PageLoadingControl>();

        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
            });

        builder.Services.AddMauiBlazorWebView();
        builder.Logging.AddConsole(options =>
        {
            options.LogToStandardErrorThreshold = LogLevel.Debug;
        });
        

#if DEBUG
		builder.Services.AddBlazorWebViewDeveloperTools();
		builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}
