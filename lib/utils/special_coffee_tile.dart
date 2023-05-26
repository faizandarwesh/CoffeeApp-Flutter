import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialCoffeeTile extends StatelessWidget {
  final String title;
  final String image;

  const SpecialCoffeeTile({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey[800],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       
        //Special coffee image
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //Special Coffee Title
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
      ]),
    );
  }
}
