import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warhammer_army_app/components/army_list.dart';
import 'package:warhammer_army_app/enums.dart';

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 26, 26),
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
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Color.fromARGB(255, 26, 26, 26),
          surfaceTintColor: Color.fromARGB(255, 26, 26, 26),
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(
              color: Colors.white,
            ),
          ),
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor:  Colors.white, shadowColor: Colors.black),
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
  List<Column> armyLists = [];
  int index = 0;
  Column current = const Column();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size(size.width, -50),
          child: const Column(),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          index = value;
          setState(() {
            index = value;
          });
        },
        selectedIndex: index,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/stat_1.svg',
              width: 24,
              height: 24,
            ),
            label: "Incursion",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/stat_2.svg',
              width: 24,
              height: 24,
            ),
            label: "Strike Force",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/stat_3.svg',
              width: 24,
              height: 24,
            ),
            label: "Onslaught",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/stat_0.svg',
              width: 24,
              height: 24,
            ),
            label: "Custom",
          )
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) =>
            _onHorizontalDrag(details),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Image(
                    image: const AssetImage("assets/necron.jpg"),
                    width: size.width,
                  ),
                  FutureBuilder(
                    future: armyList(context, ArmyTypes.values[index], size),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else if (snapshot.hasData) {
                          current = snapshot.requireData;
                          return snapshot.requireData;
                        }
                      }
                      return current;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onHorizontalDrag(DragEndDetails details) {
    if (details.primaryVelocity == 0) {
      return;
    }

    if (details.primaryVelocity?.compareTo(0) == -1) {
      setState(() {
        if (index < ArmyTypes.values.length - 1) {
          index++;
        }
      });
    } else {
      setState(() {
        if (index > 0) {
          index--;
        }
      });
    }
  }
}
