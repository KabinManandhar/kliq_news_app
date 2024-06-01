import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:line_icons/line_icons.dart';

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
    const HomeRoute(),
    const FavouriteRoute(),
    const AccountRoute(),
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
          
          body: child,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            activeIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            gapLocation: GapLocation.none,
            height: context.screenHeight / 15,
            backgroundColor: context.theme.colorScheme.background,
            activeColor: context.theme.primaryColor,
            inactiveColor: context.theme.disabledColor,
            splashColor: context.theme.disabledColor,
            elevation: 10,
            blurEffect: false,
            icons: iconData,
          ),
        );
      },
    );
  }
}
