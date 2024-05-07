import 'package:flutter/material.dart';
import 'package:warhammer_army_app/enums.dart';

Column armyList(ArmyTypes armyType) {
  return Column(
    children: <Widget>[

        Text(armyType.name),

    ],
  );
}
