namespace _40kArmyBuilder.Models
{
    public class Army(string name, string faction, Unit[] units)
    {
        public string Name { get; set; } = name;
        public string Faction { get; set; } = faction;
        public Unit[] Units { get; set; } = units;

        public int GetPoints()
        {
            if (Units == null || Units.Length < 1) return 0;
            int result = 0;
            foreach (var unit in Units)
            {
                result += unit.Points;
            }
            return result;
        }
    }
}
