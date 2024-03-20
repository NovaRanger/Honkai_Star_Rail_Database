// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:honkai_star_rail_database/pages/home_page.dart';

class IntroPage extends StatefulWidget{
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomePage()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(23, 52, 43, 207),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/images/TrialRoleAvatar_Kafka_Back.png'),fit: BoxFit.cover)),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Text("Honkai Star Rail Database", style: GoogleFonts.dmSerifDisplay(fontSize: 28,color: Colors.white)
              ),
            const SizedBox(height: 125),
            Padding(
              padding: const EdgeInsets.all(125.0),
              child: Image.asset('lib/images/kafkascary.png'),
            )
          ],
        ),
      ),
    );
  }
}