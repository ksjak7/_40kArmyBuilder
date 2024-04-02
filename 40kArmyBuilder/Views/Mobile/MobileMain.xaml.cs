namespace _40kArmyBuilder
{
    public partial class MobileMain : ContentPage
    {
        public MobileMain()
        {
            InitializeComponent();
        }
        private void RedirectMobileCreate(object sender, EventArgs e)
        {
            Shell.Current.GoToAsync("//MobileCreate");
        }
    }
}