import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  'assets/icons/FactionIcons/SpaceMarines.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Tab(
                text: 'Chaos',
                icon: SvgPicture.asset(
                  'assets/icons/FactionIcons/Chaos.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Tab(
                text: 'Xenos',
                icon: SvgPicture.asset(
                  'assets/icons/FactionIcons/Drukhari1.svg',
                  width: 36,
                  height: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Tab(
                text: 'Imperium',
                icon: SvgPicture.asset(
                  'assets/icons/FactionIcons/Imperium.svg',
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
            const Center(child: Text("Hello")),
            const Center(child: Text('CATS')),
            const Center(child: Text('BIRDS')),
          ],
        ),
      ),
    );
  }
}
