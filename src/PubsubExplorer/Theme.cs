using MudBlazor;
using MudBlazor.Services;
using MudBlazor.Utilities;

namespace PubsubExplorer;

internal static class Theme
{
    public static MudTheme Default => new MudTheme
    {
        PaletteLight = new PaletteLight
        {
            Primary = new MudColor("333E53"),
            Secondary = new MudColor("8F9097"),
            Tertiary = new MudColor("998D98"),
            AppbarBackground = new MudColor("333E53"), 
        }
    };

    public static void AddCustomTheme(MudServicesConfiguration config)
    {
        
    }
}
