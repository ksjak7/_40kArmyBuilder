namespace _40kArmyBuilder.Models
{
    public class Weapon(string Name, 
        string[] WeaponKeyword, 
        int Range, 
        string Attack, 
        int BalisticSkill, 
        int Strength, 
        int ArmorPiercing, 
        string Damage)
    {
        public string Name { get; } = Name;
        public string[] WeaponKeyword { get; } = WeaponKeyword;
        public int Range { get; } = Range;
        public string Attack { get; } = Attack;
        public int BalisticSkill { get; } = BalisticSkill;
        public int Strength { get; } = Strength;
        public int ArmorPiercing { get; } = ArmorPiercing;
        public string Damage { get; } = Damage;
    }
}
