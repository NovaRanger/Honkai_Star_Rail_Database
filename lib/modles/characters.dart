import 'dart:convert';
import 'package:flutter/services.dart';

class Character {
  final String name;
  final String path;
  final String imagePath;
  final String element;
  final String elementImage;
  final String pathImage;

  Character({
    required this.name,
    required this.path,
    required this.imagePath,
    required this.element,
    required this.elementImage,
    required this.pathImage,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      path: json['path'],
      imagePath: json['imagePath'],
      element: json['element'],
      elementImage: json['elementImage'],
      pathImage: json['pathImage'],
    );
  }
}

Future<List<Character>> fetchCharacters() async {
  final String jsonString =
  await rootBundle.loadString('assets/characters.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Character.fromJson(json)).toList();
}

