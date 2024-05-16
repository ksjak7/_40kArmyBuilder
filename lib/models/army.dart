import 'package:warhammer_army_app/enums.dart';
import 'package:warhammer_army_app/models/unit.dart';
 
class Army {
  final String name;
  final String faction;
  final ArmyTypes type;
  List<Unit> units;

  int get points => _getPoints();

  Army(
    this.name,
    this.faction,
    this.type,
    this.units
  );

  static Army fromJson(Map<String, dynamic> jsonData) {
    var rawData = jsonData['units'];
    List<Unit> unitList = []; 
    for (var object in rawData) {
      unitList.add(Unit.fromJson(object));
    }
    return Army(
      jsonData['name'],
      jsonData['faction'],
      ArmyTypes.values[jsonData['type']],
      unitList
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
    for (Unit unit in units) {
      result += unit.points;
    }
    return result;
  }
}