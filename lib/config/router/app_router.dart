import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kliq_news_app/app/account/presentation/page/account_page.dart';
import 'package:kliq_news_app/app/auth/login/presentation/page/login_page.dart';
import 'package:kliq_news_app/app/auth/register/presentation/page/register_page.dart';
import 'package:kliq_news_app/app/favourite/presentation/page/favourite_page.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/app/home/presentation/page/article_detail_screen.dart';
import 'package:kliq_news_app/app/home/presentation/page/home_page.dart';
import 'package:kliq_news_app/app/wrapper/presentation/page/wrapper_page.dart';

import 'route_name.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        //Login Page
        AutoRoute(path: RouteName.login, page: LoginRoute.page),
        //Register Page
        AutoRoute(path: RouteName.register, page: RegisterRoute.page),
        //Article Detail Page
        AutoRoute(path: RouteName.articleDetail, page: ArticleDetailRoute.page),
        // Wrapper Page,
        AutoRoute(
          path: '/',
          page: WrapperRoute.page,
          children: [
            AutoRoute(
              path: RouteName.home,
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: RouteName.favourite,
              page: FavouriteRoute.page,
            ),
            AutoRoute(
              path: RouteName.account,
              page: AccountRoute.page,
            ),
          ],
        ),
      ];
}
