import 'dart:convert';
import 'package:flutter/services.dart';

class Planar {
  final String name;
  final String twopi;
  final String orb;
  final String rope;

  Planar({
    required this.name,
    required this.twopi,
    required this.orb,
    required this.rope,
  });

  factory Planar.fromJson(Map<String, dynamic> json) {
    return Planar(
      name: json['name'],
      twopi: json['twopc'],
      orb: json['orb'],
      rope: json['rope'],
    );
  }
}

Future<List<Planar>> fetchCharacters() async {
  final String jsonString =
  await rootBundle.loadString('assets/planar.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Planar.fromJson(json)).toList();
}