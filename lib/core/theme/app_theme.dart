import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF000000);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, 
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,                        
        scrolledUnderElevation: 0,    
        toolbarHeight: 40,       
      ),
      textTheme: TextTheme(
        
        labelSmall: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.inter().fontFamily,
        )
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border:  OutlineInputBorder(),
        )
      );
  }
}