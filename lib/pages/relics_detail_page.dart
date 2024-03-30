import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/modles/relics.dart';

class RelicDetailPage extends StatelessWidget {
  final Relics relic;

  const RelicDetailPage({Key? key, required this.relic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(relic.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2-piece Set Bonus:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(relic.twopc ?? 'No 2-piece Set Bonus'),
            SizedBox(height: 16),
            if (relic.fourpc != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4-piece Set Bonus:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(relic.fourpc!),
                  SizedBox(height: 16),
                ],
              ),
            Text(
              'Gear Pieces:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            if (relic.chest != null || relic.sphere != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(relic.chest ?? 'No Chest'),
                ],
              ),
            Text(relic.helmet ?? 'No Helmet'),
            Text(relic.boots ?? 'No Boots'),
            Text(relic.gloves ?? 'No Gloves'),
          ],
        ),
      ),
    );
  }
}



