import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/app/data/theme/color_manager.dart';

ThemeData lightMode(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: ColorManager().appBarColor,
      titleTextStyle: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        backgroundColor: ColorManager().turquoise,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context)
          .textTheme
          .apply(bodyColor: Colors.black, displayColor: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 3,
            color: ColorManager().turquoise,
          ),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HexColor('#e1f4f4'),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: ColorManager().appBarColor),
      ),
      hintStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    ),
    dividerColor: Colors.black,
  );
}
