import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/app/home/presentation/provider/home_provider.dart';
import 'package:kliq_news_app/app/home/presentation/provider/home_states.dart';
import 'package:kliq_news_app/app/home/presentation/widget/article_card.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_theme_button.dart';
import 'package:kliq_news_app/core/resources/services/connectivity/connectivity_status_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityStatus = ref.watch(connectivityStatusProvider);
    final homeState = ref.watch(homeNotifierProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          duration: connectivityStatus == ConnectivityStatus.isConnected
              ? const Duration(milliseconds: 500)
              : const Duration(seconds: 30),
          content: Text(
            connectivityStatus == ConnectivityStatus.isConnected
                ? 'Welcome!'
                : 'Please reconnect to the internet',
          ),
        ),
      );
    });

    Widget buildContent() {
      switch (homeState.status) {
        case HomeStateStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case HomeStateStatus.failure:
          return const Center(child: Text('Failed to load articles'));
        case HomeStateStatus.success:
          return ListView.builder(
            itemCount: homeState.articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(article: homeState.articles.elementAt(index));
            },
          );
        default:
          return const Center(child: Text('Unknown state'));
      }
    }

    return BasePage(
      actions: const [ThemeToggleButton()],
      body: buildContent(),
      titleText: AppStrings.home,
    );
  }
}
