import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';

@RoutePage()

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      body: const Placeholder(),
      titleText: AppStrings.account,
    );
  }
}
