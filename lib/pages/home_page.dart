import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/componets/button.dart';
import 'package:honkai_star_rail_database/pages/character_detail_page.dart';
import 'package:honkai_star_rail_database/themes/colors.dart';
import 'package:honkai_star_rail_database/modles/characters.dart';
import 'package:honkai_star_rail_database/componets/character_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Character>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _charactersFuture = fetchCharacters();
  }

  void navigationToCharacterDetails(BuildContext context, Character character) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => CharacterDetailPage(character: character),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey[900],
          ),
          onPressed: () {
            // Add your menu functionality here
          },
        ),
        title: Text(
          'DataBase',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: FutureBuilder<List<Character>>(
        future: _charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Character> characters = snapshot.data ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DataBase',
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          MyButton(
                            text: "New Character",
                            onTap: () {},
                          ),
                        ],
                      ),
                      Image.asset(
                        'lib/images/kafkascary.png',
                        height: 103,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Characters",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: characters.length,
                    itemBuilder: (context, index) => CharacterTile(
                      character: characters[index],
                      onTap: () => navigationToCharacterDetails(context, characters[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the current index to reflect the Lightcones page
        selectedItemColor: Colors.blue, // Set the color for the selected item
        unselectedItemColor: Colors.black, // Set the color for the unselected items
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/character_grid');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/relics_grid');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/light_cones_grid');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grain),
            label: 'Relics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Lightcones',
          ),
        ],
      ),
    );
  }
}


