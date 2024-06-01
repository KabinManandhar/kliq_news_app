import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/config/theme/provider/theme_provider.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_button.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:line_icons/line_icons.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final User? user = FirebaseAuth.instance.currentUser;
    return BasePage(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.padding8),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  'Kabin Manandhar',
                  style: context.textTheme.headlineMedium,
                ),
                subtitle: Text(
                  user?.email ?? "no Email",
                  style: context.textTheme.bodySmall,
                ),
                leading: const Icon(LineIcons.userCircleAlt),
              ),
            ),
            const Spacer(),
            AppButton(
              label: AppStrings.logout,
              buttonColor: Colors.red,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                context.router.pushAndPopUntil(const LoginRoute(),
                    predicate: (_) => false);
              },
            ),
          ],
        ),
      ),
      titleText: AppStrings.account,
    );
  }
}
