import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/army_list.dart';
import 'enums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '40k Army Builder',
      theme: ThemeData(
        fontFamily: 'Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            surfaceTintColor: Colors.white, shadowColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Armies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> pages = [];
    for (ArmyType armyType in ArmyType.values) {
      pages.add(
        armyList(context, armyType, size),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              bottom: PreferredSize(
                preferredSize: Size(size.width, -50),
                child: const Column(),
              ),
            ),
            bottomNavigationBar: TabBar(
              labelPadding: const EdgeInsets.all(0),
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    'assets/navbar/stat_1.svg',
                    width: 36,
                    height: 36,
                  ),
                  text: "Incursion",
                ),
                Tab(
                  icon: SvgPicture.asset(
                    'assets/navbar/stat_2.svg',
                    width: 36,
                    height: 36,
                  ),
                  text: "Strike Force",
                ),
                Tab(
                  icon: SvgPicture.asset(
                    'assets/navbar/stat_3.svg',
                    width: 36,
                    height: 36,
                  ),
                  text: "Onslaught",
                ),
                Tab(
                  icon: SvgPicture.asset(
                    'assets/navbar/stat_0.svg',
                    width: 36,
                    height: 36,
                  ),
                  text: "Custom",
                ),
              ],
            ),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: TabBarView(children: pages),
            ),
          );
        },
      ),
    );
  }
}
