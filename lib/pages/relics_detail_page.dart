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
            if (relic.chest != null || relic.sphere != null || relic.rope != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (relic.chest != null) Image.asset(relic.chest!),
                  if (relic.rope != null) Image.asset(relic.rope!),
                ],
              ),
            if (relic.helmet != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Helmet:'),
                  Image.asset(relic.helmet!),
                ],
              ),
            if (relic.boots != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Boots:'),
                  Image.asset(relic.boots!),
                ],
              ),
            if (relic.gloves != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Gloves:'),
                  Image.asset(relic.gloves!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}





