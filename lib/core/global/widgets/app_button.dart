import 'package:flutter/material.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

import '../../../config/theme/app_colors_light.dart';
import '../../resources/ui_helper.dart';

class AppButton extends StatelessWidget {
  final String label;
  final EdgeInsets? padding;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.padding,
    this.width,
    this.height,
    this.buttonColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final UiHelper uiHelper = UiHelper();
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: SizedBox(
        height: height,
        width: width ?? context.screenWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                width: 2.0,
                color: borderColor ?? AppColorsLight.appBlack,
              ),
              backgroundColor: buttonColor ?? context.theme.primaryColor),
          onPressed: onPressed,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(label,
                textAlign: TextAlign.start,
                style: context.textTheme.bodyLarge!.copyWith(
                    color: uiHelper.getColorBasedOnBg(
                        color: buttonColor ?? context.theme.primaryColor,
                        context: context),
                    fontWeight: FontWeight.w900)),
          ),
        ),
      ),
    );
  }
}
