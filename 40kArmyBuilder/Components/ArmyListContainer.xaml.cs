using _40kArmyBuilder.Models;
using System.Text.Json;

namespace _40kArmyBuilder.Components
{
    public partial class ArmyListContainer : ContentView
    {
        public BindableProperty ArmyTypeProperty = BindableProperty.Create(nameof(ArmyType), typeof(string), typeof(string), "");
        public Army[]? armies = [
            new Army("ArmyOne", "Chaos Space Marines", 
                [
                new Unit("Morvenn Vahl", "Adeptas Sororitas", 135, 8, 6, 2, 8, 6, 2, [], [], [], 4, [], true, 1), 
                new Unit("Morvenn Vahl", "Adeptas Sororitas", 135, 8, 6, 2, 8, 6, 2, [], [], [], 4, [], true, 1)
                ]), 
            new Army("ArmyTwo", "T'au", [])];
        public string ArmyType
        {
            get => (string)GetValue(ArmyTypeProperty);
            set
            {
                SetValue(ArmyTypeProperty, value);
                HeaderText.Text = value;
                switch (value)
                {
                    case "Incursion":
                        File.WriteAllText($"{FileSystem.Current.CacheDirectory}/IncursionArmies.json", JsonSerializer.Serialize(armies));
                        armies = JsonSerializer.Deserialize<Army[]>(File.ReadAllText($"{FileSystem.Current.CacheDirectory}/IncursionArmies.json"));
                        if (armies != null)
                            foreach (Army army in armies)
                                ArmyList.Children.Add(new ArmyUIContainer(army));
                        HeaderButton.Clicked += async (sender, e) =>
                        {
                            await Shell.Current.GoToAsync("//Create/MobileIncursion");
                        };
                        break;
                    case "StrikeForce":
                        HeaderButton.Clicked += async (sender, e) =>
                        {
                            //await Shell.Current.GoToAsync("//Create/Onslaught");
                        };
                        break;
                    case "Onslaught":
                        HeaderButton.Clicked += async (sender, e) =>
                        {
                            //await Shell.Current.GoToAsync("//Create/StrikeForce");
                        }; ;
                        break;
                    case "Custom":
                        HeaderButton.Clicked += async (sender, e) =>
                        {
                            //await Shell.Current.GoToAsync("//Create/Custom");
                        };
                        break;
                }
            }
        }
        public ArmyListContainer()
        {
            InitializeComponent();
        }
    }
}
