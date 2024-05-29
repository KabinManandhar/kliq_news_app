import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../config/theme/app_colors_dark.dart';
import '../../../../config/theme/app_colors_light.dart';

@RoutePage()
class WrapperPage extends StatelessWidget {
  WrapperPage({super.key});

  final List<IconData> iconData = [
    LineIcons.home,
    LineIcons.heart,
    LineIcons.user,
  ];

  final List<String> titleData = [
    "home",
    "favourite",
    "account",
  ];

  final List<PageRouteInfo<dynamic>> routes = [
    // const HomeRoute(),
    // const CategoryRoute(),
    // const TimeLogRoute(),
    // const SettingsRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    // Configuring EasyLoading instance
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = context.theme.primaryColor
      ..backgroundColor = context.theme.colorScheme.background
      ..indicatorColor = context.theme.primaryColor
      ..textColor = context.theme.primaryColor
      ..maskColor = Colors.black
      ..userInteractions = true
      ..dismissOnTap = false;

    return AutoTabsRouter(
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      routes: routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: InkWell(
            onLongPress: () {
              // context.router.push(const SessionStartRoute());
            },
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: context.isDarkMode
                  ? AppColorsDark.appGreen
                  : AppColorsLight.appGreen,
              onPressed: () {
                // context.router.push(const SessionEndRoute());
              },
              disabledElevation: 0,
              elevation: 0,
              child: const Icon(Icons.play_arrow),
            ),
          ),
          body: child,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            activeIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            // gapWidth: 0,
            height: context.screenHeight / 15,
            backgroundColor: context.theme.colorScheme.background,
            activeColor: context.theme.primaryColor,
            inactiveColor: context.theme.disabledColor,
            splashColor: context.theme.disabledColor,
            elevation: 10,
            blurEffect: false,
            notchSmoothness: NotchSmoothness.softEdge,
            icons: iconData,
          ),
        );
      },
    );
  }
}
