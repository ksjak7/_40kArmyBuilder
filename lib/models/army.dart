import 'dart:convert';

import 'package:warhammer_army_app/models/unit.dart';

class Army {
  final String name;
  final String faction;
  List<Unit> units;

  int get points => _getPoints();

  Army(
    this.name,
    this.faction,
    this.units
  );

  static Army fromJson(Map<String, dynamic> jsonData) {
    var rawData = jsonData['units'];
    List<Unit> u = []; 
    for (var object in rawData) {
      u.add(Unit.fromJson(object));
    }
    return Army(
      jsonData['name'],
      jsonData['faction'],
      u
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'faction': faction,
    'units': units
  };

  int _getPoints() {
    if (units.isEmpty) {
      return 0;
    }
    int result = 0;
    for (Unit u in units) {
      result += u.points;
    }
    return result;
  }
}