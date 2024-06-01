import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/resources/services/connectivity/connectivity_status_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          duration:connectivityStatusProvider == ConnectivityStatus.isConnected? const Duration(milliseconds: 500): const Duration(seconds: 30),
          content: Text(
            connectivityStatusProvider == ConnectivityStatus.isConnected
                ? 'Welcome!'
                : 'Please reconnect to the internet',
          ),
        ),
      );
    });
    return BasePage(
      body: const Placeholder(),
      titleText: AppStrings.home,
    );
  }
}
