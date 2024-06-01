import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/app/favourite/presentation/provider/favourite_provider.dart';
import 'package:kliq_news_app/app/favourite/presentation/provider/favourite_states.dart';
import 'package:kliq_news_app/app/home/presentation/widget/article_card.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_theme_button.dart';
import 'package:kliq_news_app/core/resources/services/connectivity/connectivity_status_provider.dart';
import 'package:kliq_news_app/core/resources/services/connectivity/firebase_auth_provider.dart';

@RoutePage()
class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityStatus = ref.watch(connectivityStatusProvider);
    final favouriteState = ref.watch(favouriteNotifierProvider);
    final authStateChange =
        ref.listen(authStateChangesProvider, (previous, next) {
      if (next.value == null) {
        context.router.pushAndPopUntil(
          const LoginRoute(),
          predicate: (route) => false,
        );
      } else {
        debugPrint('logged in');
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (connectivityStatus == ConnectivityStatus.isConnected) {
        debugPrint('Connected');
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            duration: connectivityStatus == ConnectivityStatus.isConnected
                ? const Duration(milliseconds: 500)
                : const Duration(seconds: 5),
            content: Text(
              connectivityStatus == ConnectivityStatus.isConnected
                  ? 'Welcome!'
                  : 'Please reconnect to the internet',
            ),
          ),
        );
      }
    });

    Widget buildContent() {
      switch (favouriteState.status) {
        case FavouriteStateStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case FavouriteStateStatus.failure:
          return const Center(child: Text('Failed to load articles'));
        case FavouriteStateStatus.success:
          if (favouriteState.articles.isEmpty) {
            return const Center(
              child: Text(AppStrings.noFavouriteArticles),
            );
          }
          return ListView.builder(
            itemCount: favouriteState.articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(
                fromHomeScreen: false,
                article: favouriteState.articles.elementAt(index),
                index: index,
              );
            },
          );
        default:
          return const Center(child: Text('Unknown state'));
      }
    }

    return BasePage(
      actions: const [ThemeToggleButton()],
      body: buildContent(),
      titleText: AppStrings.favourite,
    );
  }
}
