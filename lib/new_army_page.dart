import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warhammer_army_app/components/faction_list.dart';

import 'enums.dart';

class NewArmyPage extends StatefulWidget {
  const NewArmyPage({super.key, required this.title});

  final String title;

  @override
  State<NewArmyPage> createState() => _NewArmyPage();
}

class _NewArmyPage extends State<NewArmyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          bottom: TabBar(
            tabAlignment: TabAlignment.fill,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Marines',
                icon: SvgPicture.asset(
                  'assets/tabbar/marines.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Tab(
                text: 'Chaos',
                icon: SvgPicture.asset(
                  'assets/tabbar/chaos.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Tab(
                text: 'Xenos',
                icon: SvgPicture.asset(
                  'assets/tabbar/drukhari.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Tab(
                text: 'Imperium',
                icon: SvgPicture.asset(
                  'assets/tabbar/imperium.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //marines
            factionList(context, [
              Faction.adeptusAstartes,
              Faction.blackTemplars,
              Faction.bloodAngels,
              Faction.darkAngels,
              Faction.deathwatch,
              Faction.greyKnights,
              Faction.spaceWolves,
            ]),
            //chaos
            factionList(context, [
              Faction.chaosDaemons,
              Faction.deathGuard,
              Faction.hereticAstartes,
              Faction.thousandSons,
              Faction.worldEaters,
            ]),
            //xenos
            factionList(context, [
              Faction.aeldari,
              Faction.drukhari,
              Faction.genestealerCults,
              Faction.leaguesOfVotann,
              Faction.necrons,
              Faction.orks,
              Faction.tauEmpire,
              Faction.tyranids,
            ]),
            //imperium
            factionList(context, [
              Faction.adeptaSororitas,
              Faction.adeptusCustodes,
              Faction.adeptusMechanicus,
              Faction.astraMilitarum,
            ]),
          ],
        ),
      ),
    );
  }
}
