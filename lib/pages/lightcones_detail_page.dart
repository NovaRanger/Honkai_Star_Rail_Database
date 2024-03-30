import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/modles/lightcones.dart';

class LightConesDetailPage extends StatelessWidget {
  final LightCones lightcone;

  const LightConesDetailPage({Key? key, required this.lightcone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lightcone.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Path: ${lightcone.path}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              lightcone.imagePath,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(lightcone.description),
            SizedBox(height: 16),
            Text(
              'Passive:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(lightcone.passive),
          ],
        ),
      ),
    );
  }
}
