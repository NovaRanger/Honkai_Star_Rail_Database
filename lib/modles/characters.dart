import 'dart:convert';
import 'package:flutter/services.dart';

class Character {
  final String name;
  final String path;
  final String imagePath;
  final String element;
  final String elementImage;
  final String pathImage;
  final String basic;
  final String basicImage;
  final String skill;
  final String skillImage;
  final String ultimate;
  final String ultimateImage;
  final String technique;
  final String techniqueImage;
  final String talent;
  final String talentImage;
  final List<String> eidolonImages;
  final List<String> eidolonContents;
  final List<String> ascensionImages;
  final List<String> ascensionContents;

  Character({
    required this.name,
    required this.path,
    required this.imagePath,
    required this.element,
    required this.elementImage,
    required this.pathImage,
    required this.basic,
    required this.basicImage,
    required this.skill,
    required this.skillImage,
    required this.ultimate,
    required this.ultimateImage,
    required this.technique,
    required this.techniqueImage,
    required this.talent,
    required this.talentImage,
    required this.eidolonImages,
    required this.eidolonContents,
    required this.ascensionImages,
    required this.ascensionContents,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? '',
      path: json['path'] ?? '',
      imagePath: json['imagePath'] ?? '',
      element: json['element'] ?? '',
      elementImage: json['elementImage'] ?? '',
      pathImage: json['pathImage'] ?? '',
      basic: json['basic'] ?? '',
      basicImage: json['basicImage'] ?? '',
      skill: json['skill'] ?? '',
      skillImage: json['skillImage'] ?? '',
      ultimate: json['ultimate'] ?? '',
      ultimateImage: json['ultimateImage'] ?? '',
      technique: json['Technique'] ?? '',
      techniqueImage: json['TechniqueImage'] ?? '',
      talent: json['Talent'] ?? '',
      talentImage: json['TalentImage'] ?? '',
      eidolonImages: List<String>.generate(6, (i) => json['eidolon${i + 1}Image'] ?? ''),
      eidolonContents: List<String>.generate(6, (i) => json['eidolon${i + 1}'] ?? ''),
      ascensionImages: [
        json['ascension2Image'] ?? '',
        json['ascension4Image'] ?? '',
        json['ascension6Image'] ?? '',
      ],
      ascensionContents: [
        json['ascension2'] ?? '',
        json['ascension4'] ?? '',
        json['ascension6'] ?? '',
      ],
    );
  }
}


Future<List<Character>> fetchCharacters() async {
  final String jsonString =
  await rootBundle.loadString('assets/characters.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Character.fromJson(json)).toList();
}