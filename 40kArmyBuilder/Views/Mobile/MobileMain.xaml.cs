namespace _40kArmyBuilder
{
    public partial class MobileMain : ContentPage
    {
        public MobileMain()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await Task.Run(() =>
            {
                var ArmyOne = new VerticalStackLayout
                {
                    BackgroundColor = new Color(255, 0, 0)
                };
                Incursion.InsertLogicalChild(0, ArmyOne);
            });
        }
    }

}