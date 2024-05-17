import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/faction_card.dart';
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
            Center(child: Text(widget.title)),
            factionCard(context, Faction.adeptusAstartes),
            const Center(child: Text('CATS')),
            const Center(child: Text('BIRDS')),
          ],
        ),
      ),
    );
  }
}
