import 'package:flutter/material.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

class UiHelper {
  static final UiHelper _singleton = UiHelper._internal();

  factory UiHelper() {
    return _singleton;
  }

  UiHelper._internal();

    final sWidth = const SizedBox(width: AppSize.size12);
  final mWidth = const SizedBox(width: AppSize.size24);
  final mlWidth = const SizedBox(width: AppSize.size36);
  final lWidth = const SizedBox(width: AppSize.size48);
  final sHeight = const SizedBox(height: AppSize.size12);
  final mHeight = const SizedBox(height: AppSize.size24);
  final mlHeight = const SizedBox(height: AppSize.size36);
  final lHeight = const SizedBox(height: AppSize.size48);


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
