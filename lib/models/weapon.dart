class Weapon {
  final String name;
  final List<String> keywords;
  final int range;
  final String attack;
  final int ballisticSkill;
  final int strength;
  final int armorPiercing;
  final String damage;

  Weapon(
    this.name, 
    this.keywords, 
    this.range, 
    this.attack, 
    this.ballisticSkill, 
    this.strength, 
    this.armorPiercing, 
    this.damage
  );

  static Weapon fromJson(Map<String, dynamic> jsonData) {
    List<String> keywords = [];
    for (String str in jsonData["keywords"]) {
      keywords.add(str);
    }
    return Weapon(
      jsonData['name'], 
      keywords, 
      jsonData['range'], 
      jsonData['attack'], 
      jsonData['ballisticSkill'], 
      jsonData['strength'], 
      jsonData['armorPiercing'], 
      jsonData['damage']
    );
  }
}