import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warhammer_army_app/enums.dart';
import 'package:warhammer_army_app/models/army.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warhammer_army_app/models/unit.dart';
import 'package:warhammer_army_app/new_army_page.dart';

FutureBuilder armyList(BuildContext context, ArmyTypes armyType, Size screen) {
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
    BuildContext context, ArmyTypes armyType, Size screen) async {
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
    widgets.add(
      Container(
        color: const Color.fromARGB(255, 50, 50, 50),
        alignment: Alignment.center,
        margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 0,
          vertical: 2,
        ),
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(army.name),
                Text(army.faction),
                Text("${army.points} Points • ${army.units.length} Units")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
                      showDragHandle: true,
                      context: context,
                      builder: ((context) {
                        List<Widget> unitRows = [
                          Text(
                            army.name,
                            textAlign: TextAlign.center,
                          )
                        ];
                        for (Unit unit in army.units) {
                          unitRows.add(Container(
                            margin: const EdgeInsetsDirectional.symmetric(
                              horizontal: 0,
                              vertical: 2,
                            ),
                            padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(unit.name),
                                Text(unit.points.toString()),
                              ],
                            ),
                          ));
                        }
                        return CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate(unitRows),
                            ),
                          ],
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

// FutureBuilder(
//                               future:
//                                   armyList(context, ArmyTypes.onslaught, size),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.done) {
//                                   if (snapshot.hasError) {
//                                     return Text(snapshot.error.toString());
//                                   } else if (snapshot.hasData) {
//                                     current = snapshot.requireData;
//                                     return snapshot.requireData;
//                                   }
//                                 }
//                                 return current;
//                               },
//                             ),
//                           ],