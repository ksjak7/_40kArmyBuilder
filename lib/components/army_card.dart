import 'package:flutter/material.dart';

import '../models/army.dart';
import '../models/unit.dart';

Container armyCard(BuildContext context, Army army) {
  return Container(
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
      );
}