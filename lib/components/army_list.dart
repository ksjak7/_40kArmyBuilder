import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warhammer_army_app/enums.dart';
import 'package:warhammer_army_app/models/army.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warhammer_army_app/models/unit.dart';

Future<Column> armyList(
    BuildContext context, ArmyTypes armyType, Size screen) async {
  Directory directory = await getApplicationDocumentsDirectory();
  var file = File('${directory.path}/${armyType.name}.json');
  file.writeAsStringSync(
      '[{"name":"Alecs Army","faction":"${armyType.name}","units":[{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10},{"name":"TestUnit","faction":"testFaction","points":110,"movement":6,"toughness":5,"save":4,"wounds":3,"leadership":2,"objectiveControl":1, "rangedWeapons":[],"meleeWeapons":[],"keywords":[],"invulnerableSave":1,"abilities":[],"isEpicHero":true,"unitSize":10}]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]},{"name":"Alecs Army","faction":"${armyType.name}","units":[]}]');
  List rawData;
  try {
    rawData = json.decode(file.readAsStringSync()) as List;
  } catch (error) {
    file.writeAsStringSync("[]");
    rawData = json.decode(file.readAsStringSync()) as List;
  }

  List<Army> armies = [];
  for (var object in rawData) {
    armies.add(Army.fromJson(object));
  }

  List<Widget> widgets = <Widget>[
    Container(
      width: screen.width,
      alignment: Alignment.center,
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 10),
      color: Colors.black,
      child: Text(armyType.name),
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
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 100, 100, 100),
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 10, vertical: 18),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
                      showDragHandle: true,
                      elevation: screen.height / 2,
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
                  child: const Icon(Icons.menu),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: widgets,
  );
}
