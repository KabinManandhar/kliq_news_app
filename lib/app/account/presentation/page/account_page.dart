import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/config/theme/provider/theme_provider.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/global/constants/app_strings.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_button.dart';
import 'package:kliq_news_app/core/global/widgets/app_text_field.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:kliq_news_app/core/resources/services/connectivity/firebase_auth_provider.dart';
import 'package:kliq_news_app/core/resources/ui_helper.dart';
import 'package:line_icons/line_icons.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
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

    return BasePage(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.padding8),
        child: Column(
          children: [
            Card(
              child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UiHelper().mHeight,
                                        Text(
                                          "Update your name",
                                          style:
                                              context.textTheme.headlineSmall,
                                        ),
                                        const Divider(),
                                        AppTextField(
                                            hintText: 'Enter your name',
                                            controller: nameController,
                                            label: 'Enter your name'),
                                        AppButton(
                                          label: 'Update',
                                          onPressed: () {
                                            snapshot.data?.updateDisplayName(
                                                nameController.text);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        UiHelper().lHeight,
                                        UiHelper().lHeight,
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        trailing: const Icon(LineIcons.arrowRight),
                        title: Text(
                          snapshot.data?.displayName ?? "no name",
                          style: context.textTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          snapshot.data?.email ?? "no Email",
                          style: context.textTheme.bodySmall,
                        ),
                        leading: const Icon(LineIcons.userCircleAlt),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            const Spacer(),
            AppButton(
              label: AppStrings.logout,
              buttonColor: Colors.red,
              onPressed: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );

                if (shouldLogout == true) {
                  await FirebaseAuth.instance.signOut();
                  context.router.pushAndPopUntil(const LoginRoute(),
                      predicate: (_) => false);
                }
              },
            ),
          ],
        ),
      ),
      titleText: AppStrings.account,
    );
  }
}
