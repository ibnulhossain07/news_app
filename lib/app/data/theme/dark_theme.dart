import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app/data/theme/color_manager.dart';

ThemeData darkMode(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: ColorManager().lightGreenSecond,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorManager().lightGreen,
      ),
      elevation: 0,
      backgroundColor: ColorManager().blueGrey,
      titleTextStyle: GoogleFonts.amiri(
        textStyle: TextStyle(
          color: ColorManager().lightGreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        backgroundColor: ColorManager().darkRed,
      ),
    ),
    textTheme: GoogleFonts.amiriTextTheme(
      Theme.of(context).textTheme.apply(
            bodyColor: ColorManager().lightGreen,
            displayColor: ColorManager().lightGreen,
          ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorManager().lightGreenSecond,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 3,
            color: ColorManager().lightGreenSecond,
          ),
        ),
      ),
    ),
    scaffoldBackgroundColor: ColorManager().blueGrey,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: ColorManager().lightGreenSecond,
        fontSize: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager().lightGreen,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager().lightGreen,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    dividerColor: ColorManager().lightGreen,
  );
}
