import 'package:flutter/material.dart';
import 'package:warhammer_army_app/components/army_list.dart';
import 'package:warhammer_army_app/enums.dart';

List<Column> armyListContainer() {
  return [
    armyList(ArmyTypes.incursion),
    armyList(ArmyTypes.strikeForce),
    armyList(ArmyTypes.onslaught),
    armyList(ArmyTypes.custom),
  ];
}