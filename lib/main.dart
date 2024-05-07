import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:warhammer_army_app/components/army_carousel_items.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 99, 51, 51)),
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
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate( <Widget>[
              CarouselSlider(
                items: armyListContainer(),
                options: CarouselOptions(
                  height: size.height
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
