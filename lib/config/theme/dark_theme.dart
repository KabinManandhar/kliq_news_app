import 'package:flutter/material.dart';

import 'app_colors_dark.dart';
import 'typography.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColorsDark.appPrimary,
    disabledColor: AppColorsDark.appGrey,
    visualDensity: VisualDensity.comfortable,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColorsDark.appWhite,
          textStyle: darkTextTheme(context).titleLarge),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColorsDark.appBlack,
          textStyle: darkTextTheme(context)
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w400)),
    ),
    iconTheme: const IconThemeData(color: AppColorsDark.appWhite),
    scaffoldBackgroundColor: AppColorsDark.appBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDark.appBackgroundColor,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: darkTextTheme(context).headlineSmall,
      elevation: 10,
      iconTheme: const IconThemeData(
        color: AppColorsDark.appPrimary,
      ),
    ),
    textTheme: darkTextTheme(context),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: AppColorsDark.appBackgroundColor,
      surface: AppColorsDark.appSurfaceColor,
      onBackground: AppColorsDark.appOnBackgroundColor,
      onSurface: AppColorsDark.appOnBackgroundColor,
      primary: AppColorsDark.appPrimaryColor,
      onPrimary: AppColorsDark.appOnPrimaryColor,
      secondary: AppColorsDark.appSecondaryColor,
      onSecondary: AppColorsDark.appOnSecondaryColor,
      error: AppColorsDark.appErrorColor,
      onError: AppColorsDark.appOnErrorColor,
    ),
  );
}
