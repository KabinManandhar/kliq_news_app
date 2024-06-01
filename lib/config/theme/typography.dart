import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors_light.dart';

TextTheme lightTextTheme(BuildContext context) {
  return TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: AppColorsLight.appBlack,
    ),
    displayMedium: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 38,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    displaySmall: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 11,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25,
    ),
    labelLarge: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.25,
    ),
    bodySmall: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelSmall: GoogleFonts.manrope(
      color: AppColorsLight.appBlack,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
  );
}

TextTheme darkTextTheme(BuildContext context) {
  return TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColorsLight.appWhite,
    ),
    displayMedium: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 38,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    displaySmall: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 11,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25,
    ),
    labelLarge: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.25,
    ),
    bodySmall: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelSmall: GoogleFonts.manrope(
      color: AppColorsLight.appWhite,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
  );
}
