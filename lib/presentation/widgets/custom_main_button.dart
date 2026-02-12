import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class MainButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool isSecondary;

  const MainButton({super.key, this.onTap, required this.text, this.isSecondary = false});


  @override
  Widget build(BuildContext context) {

    Color mainColor = isSecondary ? Colors.white : Colors.black;
    Color altColor = isSecondary ? Colors.black : Colors.white;


    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(mainColor),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ))
        ),
        child: Text(text, style: TextStyle(color: altColor, fontSize: 18, fontFamily: GoogleFonts.inter().fontFamily),)
      ),
    );
  }
}