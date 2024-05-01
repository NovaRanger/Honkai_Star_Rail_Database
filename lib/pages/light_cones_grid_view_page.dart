import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/modles/lightcones.dart';
import 'package:honkai_star_rail_database/pages/lightcones_detail_page.dart';

class LightConesGridViewPage extends StatelessWidget {
  const LightConesGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lightcones'),
      ),
      backgroundColor: Colors.blueGrey,
      body: FutureBuilder<List<LightCones>>(
        future: fetchLightCones(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final lightcones = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: lightcones.length,
              itemBuilder: (context, index) {
                final lightcone = lightcones[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LightConesDetailPage(lightcone: lightcone),
                      ),
                    );
                  },
                  child: Container(
                    child: Card(
                      child: Container(
                        color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              lightcone.imagePath,
                              height: 100,
                            ),
                            SizedBox(height: 8),
                            Text(
                              lightcone.name,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 3, // Set the current index to reflect the Lightcones page
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

