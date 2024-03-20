import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honkai_star_rail_database/modles/characters.dart';
class CharacterTile extends StatelessWidget {
  final Character character;
  final void Function()? onTap;
  const CharacterTile({super.key, required this.character,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              character.imagePath,
              height: 200,
            ),
            Text(
              character.name,
              style: GoogleFonts.dmSerifDisplay(fontSize:20),
            ),
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                          character.element,
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)
                      ),
                      Image.asset(
                        character.elementImage,
                        height: 34,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(character.path,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87)),
                      Image.asset(
                        character.pathImage,
                        height: 34,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
