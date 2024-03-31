namespace _40kArmyBuilder
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            Microsoft.Maui.Handlers.WebViewHandler.Mapper.AppendToMapping("MyCustomization", (handler, view) =>
            {
#if ANDROID
                handler.PlatformView.Settings.JavaScriptEnabled = true;
                handler.PlatformView.Settings.AllowFileAccess = true;
                handler.PlatformView.Settings.AllowFileAccessFromFileURLs = true;
                handler.PlatformView.Settings.AllowUniversalAccessFromFileURLs = true;

#elif IOS
#endif
            });
#if IOS || ANDROID
            MainPage = new MobileShell();
#else
            MainPage = new DesktopShell();
#endif
        }
    }
}
