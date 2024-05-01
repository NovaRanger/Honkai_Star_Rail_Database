import 'package:flutter/material.dart';
import 'package:honkai_star_rail_database/modles/characters.dart';

class CharacterDetailPage extends StatefulWidget {
  final Character character;

  const CharacterDetailPage({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlueAccent,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  widget.character.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.character.elementImage,
                    height: 50,
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    widget.character.pathImage,
                    height: 50,
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildDropdownList('Basic', widget.character.basic, widget.character.basicImage),
              _buildDropdownList('Skill', widget.character.skill, widget.character.skillImage),
              _buildDropdownList('Ultimate', widget.character.ultimate, widget.character.ultimateImage),
              _buildDropdownList('Technique', widget.character.technique, widget.character.techniqueImage),
              _buildDropdownList('Talent', widget.character.talent, widget.character.talentImage),
              _buildDropdownListWithContent('Eidolons', widget.character.eidolonImages, widget.character.eidolonContents),
              _buildDropdownListWithContent('Ascensions', widget.character.ascensionImages, widget.character.ascensionContents),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownList(String title, String? content, String? imagePath) {
    if (content == null || imagePath == null) {
      return SizedBox.shrink(); // Return an empty SizedBox if content or imagePath is null
    }

    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$content'),
            SizedBox(height: 8),
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownListWithContent(String title, List<String> images, List<String> contents) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        for (int i = 0; i < images.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                images[i],
                height: 100,
                width: 100,
              ),
              Text('${contents[i]}'),
            ],
          ),
      ],
    );
  }
}








