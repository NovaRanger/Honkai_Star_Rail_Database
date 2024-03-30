import 'dart:convert';
import 'package:flutter/services.dart';

class LightCones {
  final String name;
  final String path;
  final String imagePath;
  final String description;
  final String passive;
  final String pathImage;

  LightCones({
    required this.name,
    required this.path,
    required this.imagePath,
    required this.description,
    required this.passive,
    required this.pathImage,
  });

  factory LightCones.fromJson(Map<String, dynamic> json) {
    return LightCones(
      name: json['name'],
      path: json['path'],
      imagePath: json['imagePath'],
      description: json['description'],
      passive: json['passive'],
      pathImage: json['pathImage'],
    );
  }
}

Future<List<LightCones>> fetchLightCones() async {
  final String jsonString =
  await rootBundle.loadString('assets/lightcones.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => LightCones.fromJson(json)).toList();
}
