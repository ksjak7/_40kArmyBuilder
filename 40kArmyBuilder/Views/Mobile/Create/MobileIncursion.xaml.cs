namespace _40kArmyBuilder
{
    public partial class MobileIncursion : ContentPage
    {
        public MobileIncursion()
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
