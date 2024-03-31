using _40kArmyBuilder.Models;
using System.Text.Json;

namespace _40kArmyBuilder.Components
{
    public partial class UnitUIContainer : ContentView
    {
        public BindableProperty _unit = BindableProperty.Create(nameof(Unit), typeof(string), typeof(string), "");
        public Unit Unit
        {
            get
            {
                var result = JsonSerializer.Deserialize<Unit>((string)GetValue(_unit));
                return result ?? new Unit("", "", -1, -1, -1, -1, -1, -1, -1, [], [], [], -1, [], false, -1);
            }
            set
            {
                SetValue(_unit, JsonSerializer.Serialize(value));
                Name.Text = Unit.Name;
                Points.Text = Unit.Points.ToString();
            }
        }
        public UnitUIContainer(Unit unit)
        {
            InitializeComponent();
            this.Unit = unit;
        }
    }
}
