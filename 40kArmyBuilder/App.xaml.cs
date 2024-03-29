namespace _40kArmyBuilder
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
#if IOS || ANDROID
            MainPage = new MobileShell();
#else
            MainPage = new DesktopShell();
#endif
        }
    }
}
