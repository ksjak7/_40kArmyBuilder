namespace _40kArmyBuilder.Models
{
    public class Unit(string Name, 
        string Faction, 
        int Points, 
        int Movement, 
        int Toughness, 
        int Save, 
        int Wounds, 
        int Leadership, 
        int ObjectiveControl, 
        Weapon[] RangedWeapons, 
        Weapon[] MeleeWeapons, 
        string[] Keywords, 
        int InvulnerableSave, 
        string[] Abilities, 
        bool IsEpicHero, 
        int UnitSize)
    {
        public string Name { get; } = Name;
        public string Faction { get; } = Faction;
        public int Points { get; } = Points;
        public int UnitSize { get; } = UnitSize;
        public int Movement { get; } = Movement;
        public int Toughness { get; } = Toughness;
        public int Save { get; } = Save;
        public int Wounds { get; } = Wounds;
        public int Leadership { get; } = Leadership;
        public int ObjectiveControl { get; } = ObjectiveControl;
        public Weapon[] RangedWeapons { get; } = RangedWeapons;
        public Weapon[] MeleeWeapons { get; } = MeleeWeapons;
        public string[] Abilities { get; } = Abilities;
        public int InvulnerableSave { get; } = InvulnerableSave;
        public string[] Keywords { get; } = Keywords;
        public bool IsEpicHero { get; } = IsEpicHero;
    }
}
