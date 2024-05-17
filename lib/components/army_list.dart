import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../enums.dart';
import '../models/army.dart';
import '../new_army_page.dart';
import 'army_card.dart';

FutureBuilder armyList(BuildContext context, ArmyType armyType, Size screen) {
  return FutureBuilder(
    future: armyListBuilder(context, armyType, screen),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return snapshot.requireData;
        }
      }
      return const Column();
    },
  );
}

Future<CustomScrollView> armyListBuilder(
    BuildContext context, ArmyType armyType, Size screen) async {
  Directory directory = await getApplicationDocumentsDirectory();
  var file = File('${directory.path}/armies.json');
  file.writeAsStringSync('[{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[{"name": "Legionnaire", "faction":"Chaos Space Marines", "points": 110, "movement": 6, "toughness": 4, "save": 3, "wounds": 2, "leadership": 1, "objectiveControl": 1, "rangedWeapons": [], "meleeWeapons": [], "keywords": [], "invulnerableSave": -1, "abilities": [], "isEpicHero": false, "unitSize": 10}]},{"name":"Clayton\'s Army","faction":"Necrons","type":1,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]},{"name":"Alec\'s Army","faction":"Chaos Space Marines","type":0,"units":[]}]');
  List rawData;
  try {
    rawData = json.decode(file.readAsStringSync()) as List;
  } catch (error) {
    file.writeAsStringSync("[]");
    rawData = json.decode(file.readAsStringSync()) as List;
  }

  List<Army> armies = [];
  for (var object in rawData) {
    var army = Army.fromJson(object);
    if (army.type == armyType) {
      armies.add(army);
    }
  }

  List<Widget> widgets = <Widget>[
    Container(
      width: screen.width,
      alignment: Alignment.center,
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 10),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(armyType.name),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewArmyPage(title: armyType.name),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    )
  ];

  for (Army army in armies) {
    if (context.mounted) {
      widgets.add(
        armyCard(context, army)
      );
    }
  }

  return CustomScrollView(
    slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widgets,
          )
        ]),
      ),
    ],
  );
}