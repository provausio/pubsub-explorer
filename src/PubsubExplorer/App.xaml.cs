namespace PubsubExplorer;

public partial class App : Application
{
    public App()
    {
        InitializeComponent();

        MainPage = new MainPage();
    }

    protected override Window CreateWindow(IActivationState? activationState)
    {
        var window = base.CreateWindow(activationState);
        window.Width = 1540;
        window.Height = 1080;
        window.MaximumWidth = double.PositiveInfinity;
        window.MaximumHeight = 1080;
        window.MinimumWidth = 900;
        window.MinimumHeight = 1080;
        return window;
    }
}
