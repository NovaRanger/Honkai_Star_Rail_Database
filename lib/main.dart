import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/pages/character_grid_view_page.dart';
import 'package:honkai_star_rail_database/pages/home_page.dart';
import 'package:honkai_star_rail_database/pages/intro_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro', // Set initial route to IntroPage
      routes: {
        '/intro': (context) => const IntroPage(),
        '/home': (context) => const HomePage(),
        '/character_grid': (context) => const CharacterGridViewPage(),
      },
    );
  }
}



