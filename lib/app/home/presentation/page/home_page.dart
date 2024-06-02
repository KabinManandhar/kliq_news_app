import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/app/home/data/model/news_article_model/article_model.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/app/home/presentation/provider/home_provider.dart';
import 'package:kliq_news_app/app/home/presentation/provider/home_states.dart';
import 'package:kliq_news_app/app/home/presentation/widget/article_card.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_button.dart';
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
      switch (homeState.status) {
        case HomeStateStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case HomeStateStatus.failure:
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Failed to load articles'),
                AppButton(
                  label: 'Reload',
                  onPressed: () {
                    return ref.refresh(homeNotifierProvider);
                  },
                ),
              ],
            ),
          );
        case HomeStateStatus.success:
          return RefreshIndicator(
            onRefresh: () async {
              return await ref.refresh(homeNotifierProvider);
            },
            child: ListView.builder(
              itemCount: homeState.articles.length,
              itemBuilder: (context, index) {
                return ArticleCard(
                  article: ArticleEntity.fromModel(
                    homeState.articles.elementAt(index) as ArticleModel,
                  ),
                );
              },
            ),
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
