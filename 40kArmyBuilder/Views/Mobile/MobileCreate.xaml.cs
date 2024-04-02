using _40kArmyBuilder.Models;
using System.Text.Json;

namespace _40kArmyBuilder
{
    public partial class MobileCreate : ContentPage
    {
        Army[]? currentArmyList = null;
        readonly static Dictionary<int, string> armyTypeMap = new()
        {
            { 0, "Incursion" },
            { 1, "StrikeForce" },
            { 2, "Onslaught" },
            { 3, "Custom" }
        };

        public MobileCreate()
        {
            InitializeComponent();
        }
        protected override bool OnBackButtonPressed()
        {
            Shell.Current.GoToAsync("//MobileMain");
            return true;
        }

        private void FinalizeArmy(object sender, EventArgs e)
        {
            if (ArmyNameInput.Text == "" || FactionInput.Text == "" || SizeInput.Text == "")
                return;
            Output.Text += armyTypeMap[int.Parse(SizeInput.Text)];
            string rootPath = FileSystem.Current.CacheDirectory;
            if (!File.Exists($"{rootPath}/{armyTypeMap[int.Parse(SizeInput.Text)]}Armies.json"))
                currentArmyList = [];
            else
                currentArmyList = JsonSerializer.Deserialize<Army[]>(File.ReadAllText($"{rootPath}/{armyTypeMap[int.Parse(SizeInput.Text)]}Armies.json")) ?? [];
            Output.Text += currentArmyList.Length;
            Army newArmy = new(ArmyNameInput.Text, FactionInput.Text, []);
            currentArmyList = [.. currentArmyList, newArmy];
            Output.Text += currentArmyList.Length;
            File.WriteAllText($"{FileSystem.Current.CacheDirectory}/{armyTypeMap[int.Parse(SizeInput.Text)]}Armies.json", JsonSerializer.Serialize(currentArmyList));
        }
    }

}
