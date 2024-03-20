import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/modles/characters.dart';
class CharacterDetailPage extends StatefulWidget {
  final Character character;
  const CharacterDetailPage({super.key,required this.character});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(
                  widget.character.imagePath,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(
                      widget.character.elementImage,
                      height: 50,
                    ),
                    Image.asset(
                      widget.character.pathImage,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
