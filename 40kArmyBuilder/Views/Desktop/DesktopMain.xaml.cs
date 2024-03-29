namespace _40kArmyBuilder
{
    public partial class DesktopMain : ContentPage
    {
        int count = 0;

        public DesktopMain()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            TestLabel.Text = "Success";
            Window.SizeChanged += (sender, e) =>
            {
                count++;
                TestLabel.Text = count.ToString();
            };
        }

        private void OnCounterClicked(object sender, EventArgs e)
        {
            count++;

            if (count == 1)
                CounterBtn.Text = $"Clicked {count} time";
            else
                CounterBtn.Text = $"Clicked {count} times";

            SemanticScreenReader.Announce(CounterBtn.Text);
        }

        private void ClaytonFunction(object sender, EventArgs e)
        {
            ClaytonBtn.Text = "Clayton";
        }
    }

}
