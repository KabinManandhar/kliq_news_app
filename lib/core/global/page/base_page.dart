import 'package:flutter/material.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

import '../../resources/ui_helper.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final String? titleText;
  final Color? appBarColor;
  final Color? color;
  final bool resizeToAvoidBottomInset;
  final bool hideAppBar;
  final List<Widget> actions;
  final Widget? bottomSheet;
  final Widget? titleWidget;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final PreferredSizeWidget? bottomWidget;
  final double elevation;
  final bool automaticallyImplyiLeading;
  final Widget? floatingActionButton;
  final UiHelper _uiHelper = UiHelper();

  BasePage({
    super.key,
    this.automaticallyImplyiLeading = false,
    this.titleText,
    this.titleWidget,
    required this.body,
    this.appBarColor,
    this.color,
    this.resizeToAvoidBottomInset = true,
    this.bottomSheet,
    this.actions = const [],
    this.bottomNavigationBar,
    this.bottomWidget,
    this.elevation = 0,
    this.leading,
    this.floatingActionButton,
    this.hideAppBar = false,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: color,
          extendBody: true,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: hideAppBar ? null : toolbar(context),
          body: body,
          floatingActionButton: floatingActionButton,
        ),
      );

  PreferredSize toolbar(BuildContext context) => PreferredSize(
        preferredSize: Size.fromHeight(bottomWidget != null
            ? 140.0
            : (titleText != null || titleWidget != null)
                ? 56.0
                : 0.0),
        child: AppBar(
          automaticallyImplyLeading: automaticallyImplyiLeading,
          centerTitle: false,
          leading: leading,
          actions: actions,
          elevation: elevation,
          title: titleWidget ??
              Text(
                titleText ?? '',
                style: TextStyle(
                    color: _uiHelper.getColorBasedOnBg(
                        color:
                            appBarColor ?? context.theme.colorScheme.background,
                        context: context)),
              ),
          backgroundColor: appBarColor ?? context.theme.colorScheme.background,
          bottom: bottomWidget,
        ),
      );
}
