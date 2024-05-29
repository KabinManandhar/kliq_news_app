import 'package:flutter/material.dart';

import 'app_colors_light.dart';
import 'typography.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColorsLight.appBlack,
    disabledColor: AppColorsLight.appGrey,
    visualDensity: VisualDensity.comfortable,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColorsLight.appBlack,
          textStyle: lightTextTheme(context).titleLarge),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColorsLight.appBlack,
          textStyle: lightTextTheme(context)
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w400)),
    ),
    iconTheme: const IconThemeData(color: AppColorsLight.appBlack),
    scaffoldBackgroundColor: AppColorsLight.appBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLight.appWhite,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: lightTextTheme(context).headlineSmall,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: AppColorsLight.appPrimary,
      ),
    ),
    textTheme: lightTextTheme(context),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: AppColorsLight.appBackgroundColor,
      surface: AppColorsLight.appSurfaceColor,
      onBackground: AppColorsLight.appOnBackgroundColor,
      onSurface: AppColorsLight.appOnBackgroundColor,
      primary: AppColorsLight.appPrimaryColor,
      onPrimary: AppColorsLight.appOnPrimaryColor,
      secondary: AppColorsLight.appSecondaryColor,
      onSecondary: AppColorsLight.appOnSecondaryColor,
      error: AppColorsLight.appErrorColor,
      onError: AppColorsLight.appOnErrorColor,
    ),
  );
}
