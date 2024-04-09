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
      MaterialPageRoute(
        builder: (_) => CharacterDetailPage(character: character),
      ),
    );
  }

  Character? findCharacterByName(List<Character> characters, String characterName) {
    return characters.firstWhere((character) => character.name == characterName);
  }

  void navigateToCharacterByName(BuildContext context, List<Character> characters, String characterName) {
    Character? targetCharacter = findCharacterByName(characters, characterName);

    if (targetCharacter != null) {
      navigationToCharacterDetails(context, targetCharacter);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Character Not Found'),
            content: Text('The character with the name $characterName was not found.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
          'DataBank',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: FutureBuilder<List<Character>>(
        future: _charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
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
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DataBank',
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          MyButton(
                            text: "New Character",
                            onTap: () {
                              navigateToCharacterByName(context, characters, 'Acheron');
                            },
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
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
        items: const [
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

