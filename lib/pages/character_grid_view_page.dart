import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/modles/characters.dart';
import 'package:honkai_star_rail_database/pages/character_detail_page.dart';

class CharacterGridViewPage extends StatelessWidget {
  const CharacterGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: FutureBuilder<List<Character>>(
        future: fetchCharacters(), // Assuming you have a function to fetch characters
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while loading
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if there's an error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Once data is loaded successfully, display it in a GridView
            final characters = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return InkWell(
                  onTap: () {
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
                  },
                  child: Card(
                    // Example of displaying character data in a Card widget
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          character.imagePath,
                          height: 100,
                        ),
                        SizedBox(height: 8),
                        Text(
                          character.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the current index to reflect the Lightcones page
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


