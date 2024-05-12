import 'dart:convert';

import 'package:warhammer_army_app/models/weapon.dart';

class Unit {
  final String name;
  final String faction;
  final int points;
  final int movement;
  final int toughness;
  final int save;
  final int wounds;
  final int leadership;
  final int objectiveControl;
  final List<Weapon> rangedWeapons;
  final List<Weapon> meleeWeapons;
  final List<String> keywords;
  final int invulnerableSave;
  final List<String> abilities;
  final bool isEpicHero;
  final int unitSize;

  Unit(
    this.name,
    this.faction,
    this.points,
    this.movement,
    this.toughness,
    this.save,
    this.wounds,
    this.leadership,
    this.objectiveControl,
    this.rangedWeapons,
    this.meleeWeapons,
    this.keywords,
    this.invulnerableSave,
    this.abilities,
    this.isEpicHero,
    this.unitSize
  );

  static Unit fromJson(Map<String, dynamic> jsonData) {
    List<Weapon> rangedWeapons = []; 
    List<Weapon> meleeWeapons = [];
    List<String> keywords = [];
    List<String> abilities = [];
    for (var object in jsonData["rangedWeapons"]) {
      rangedWeapons.add(Weapon.fromJson(object));
    }
    for (var object in jsonData["meleeWeapons"]) {
      meleeWeapons.add(Weapon.fromJson(object));
    }
    for (String str in jsonData["keywords"]) {
      keywords.add(str);
    }
    for (String str in jsonData["abilities"]) {
      abilities.add(str);
    }
    return Unit(
      jsonData['name'],
      jsonData['faction'],
      jsonData['points'],
      jsonData['movement'],
      jsonData['toughness'],
      jsonData['save'],
      jsonData['wounds'],
      jsonData['leadership'],
      jsonData['objectiveControl'],
      rangedWeapons,
      meleeWeapons,
      keywords,
      jsonData['invulnerableSave'],
      abilities,
      jsonData['isEpicHero'],
      jsonData['unitSize']
    );
  }
}