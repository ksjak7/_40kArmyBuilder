namespace _40kArmyBuilder
{
    public partial class MobileEdit : ContentPage
    {
        public MobileEdit()
        {
            InitializeComponent();
        }
        protected override bool OnBackButtonPressed()
        {
            Shell.Current.GoToAsync("//MobileMain");
            return true;
        }
    }

}
