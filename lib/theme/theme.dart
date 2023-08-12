

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static TextTheme lightTextTheme = TextTheme(

    //title large
      titleLarge: GoogleFonts.outfit(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: AppColors.black),

      //caption grey
      titleMedium: GoogleFonts.outfit(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: AppColors.black
      ),

      //Smaller body Text
      bodyMedium: GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black),

      //For larger body text
      bodyLarge: GoogleFonts.outfit(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.black),

      // Caption
      bodySmall: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),

      //button
      labelSmall: GoogleFonts.outfit(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.black),

      //button
      headlineSmall: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColors.black),

      headlineMedium: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.black)
  );

  // Theme configuration for light mode
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.primaryColor)),
      appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.black,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.onPrimaryColor,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark
          )
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.onPrimaryColor,
        backgroundColor: AppColors.primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryColor),
      textTheme: lightTextTheme,
    );
  }
}