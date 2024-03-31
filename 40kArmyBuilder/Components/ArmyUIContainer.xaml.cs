using _40kArmyBuilder.Models;
using System.Text.Json;
using static System.Net.Mime.MediaTypeNames;
using System.Xml.Linq;

namespace _40kArmyBuilder.Components
{
    public partial class ArmyUIContainer : ContentView
    {
        public BindableProperty _armyName = BindableProperty.Create(nameof(Army), typeof(string), typeof(string), "");
        bool expanded = false;
        public Army Army
        {
            get
            {
                var result = JsonSerializer.Deserialize<Army>((string)GetValue(_armyName));
                return result ?? new Army("", "", []);
            }
            set
            {
                SetValue(_armyName, JsonSerializer.Serialize(value));
                ArmyName.Text = value.Name;
                Faction.Text = value.Faction;
                Points.Text = value.GetPoints().ToString() + " Points • " + value.Units.Length.ToString() + " Units";
            }
        }
        public ArmyUIContainer(Army army)
        {
            InitializeComponent();
            this.Army = army;
        }

        private void ExpandUnits(object sender, EventArgs e)
        {
            expanded = !expanded;
            if (expanded)
            {
                ExpandCloseButton.Text = "▼";
                foreach (Unit unit in Army.Units)
                    UnitContainer.Children.Add(new UnitUIContainer(unit));
            }
            else
            {
                ExpandCloseButton.Text = "▲";
                UnitContainer.Children.Clear();
            }

        }
    }
}
