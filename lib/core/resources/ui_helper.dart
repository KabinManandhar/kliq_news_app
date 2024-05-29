import 'package:flutter/material.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

class UiHelper {
  static final UiHelper _singleton = UiHelper._internal();

  factory UiHelper() {
    return _singleton;
  }

  UiHelper._internal();

  Color getColorBasedOnBg(
      {required Color color,
      required BuildContext context,
      bool reverseColor = false}) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    Color returnColor = context.theme.colorScheme.background;

    if ((context.isDarkMode && !reverseColor) ||
        (!context.isDarkMode && reverseColor)) {
      returnColor = brightness == Brightness.light
          ? context.theme.colorScheme.background
          : context.theme.colorScheme.onBackground;
    } else {
      returnColor = brightness == Brightness.dark
          ? context.theme.colorScheme.background
          : context.theme.colorScheme.onBackground;
    }

    return returnColor;
  }
}
