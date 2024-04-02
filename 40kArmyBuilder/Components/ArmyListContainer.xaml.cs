using _40kArmyBuilder.Models;
using System.ComponentModel;
using System.Text.Json;

namespace _40kArmyBuilder.Components
{
    public partial class ArmyListContainer : ContentView
    {
        readonly static Dictionary<int, string> armyTypeMap = new()
        {
            { 0, "Incursion" },
            { 1, "StrikeForce" },
            { 2, "Onslaught" },
            { 3, "Custom" }
        };

        public BindableProperty ArmyTypeProperty = BindableProperty.Create(nameof(ArmyType), typeof(int), typeof(int), 0);
        //File.WriteAllText($"{FileSystem.Current.CacheDirectory}/{armyTypeMap[value]}Armies.json", JsonSerializer.Serialize(armies));
        static Army[]? currentArmyList = null;
        readonly static string rootPath = FileSystem.Current.CacheDirectory;
        public int ArmyType
        {
            get => (int)GetValue(ArmyTypeProperty);
            set
            {
                SetValue(ArmyTypeProperty, value);
                HeaderText.Text = armyTypeMap[value];
                ArmyList.Children.Clear();
                if (File.Exists($"{rootPath}/{armyTypeMap[value]}Armies.json"))
                    currentArmyList = JsonSerializer.Deserialize<Army[]>(File.ReadAllText($"{rootPath}/{armyTypeMap[value]}Armies.json"));
                else
                    currentArmyList = null;
                if (currentArmyList != null)
                    foreach (Army army in currentArmyList)
                        ArmyList.Children.Add(new ArmyUIContainer(army));
            }
        }
        public ArmyListContainer()
        {
            InitializeComponent();
            ArmyType = 0;
            LeftButton.Clicked += (sender, e) => 
            {
                if (ArmyType <= 0)
                    ArmyType = armyTypeMap.Count - 1;
                else
                    ArmyType--;
            };
            RightButton.Clicked += (sender, e) => 
            {
                if (ArmyType >= armyTypeMap.Count - 1)
                    ArmyType = 0;
                else 
                    ArmyType++;
            };
        }
    }
}
