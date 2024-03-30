import 'dart:convert';
import 'package:flutter/services.dart';

class Relics {
  final String name;
  final String twopc;
  final String? fourpc;
  final String? chest;
  final String? helmet;
  final String? boots;
  final String? gloves;
  final String? rope;
  final String? sphere;

  Relics({
    required this.name,
    required this.twopc,
    this.fourpc,
    this.chest,
    this.helmet,
    this.boots,
    this.gloves,
    this.rope,
    this.sphere,
  });

  factory Relics.fromJson(Map<String, dynamic> json) {
    return Relics(
      name: json['name'],
      twopc: json['twopc'],
      fourpc: json['fourpc'],
      chest: json['chest'],
      helmet: json['helmet'],
      boots: json['boots'],
      gloves: json['gloves'],
      rope: json['rope'],
      sphere: json['sphere'],
    );
  }
}

Future<List<Relics>> fetchRelics() async {
  final String jsonString =
  await rootBundle.loadString('assets/relics.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Relics.fromJson(json)).toList();
}
