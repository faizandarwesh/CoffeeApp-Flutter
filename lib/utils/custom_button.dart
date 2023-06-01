import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function callback;
  final Color textColor;
  final String icon;
  final Color borderColor;

  const CustomButton({Key? key, required this.text,required this.color,required this.textColor,required this.callback,required this.icon,required this.borderColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(onTap: (){},
        child:  Container(
          height: 70,
          width: screenSize.width * 80,
          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 8),
          child: ElevatedButton(
          onPressed: null,
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: BorderSide(color: borderColor)
              )
          ), child: Text('$text', style:
          GoogleFonts.nunito(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          ),
        ),
        ),
      );
  }
}
