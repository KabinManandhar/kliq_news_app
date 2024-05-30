import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_button.dart';
import 'package:kliq_news_app/core/global/widgets/app_text_field.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:kliq_news_app/core/resources/ui_helper.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UiHelper uiHelper = UiHelper();
    return BasePage(
      titleText: " ",
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.padding14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            _welcomeTexts(context),
            uiHelper.mHeight,
            const AppTextField(
              hintText: 'Email',
              label: 'Email',
              hidePadding: true,
            ),
            uiHelper.sHeight,
            const AppTextField(
              hintText: 'Password',
              label: 'Password',
              hidePadding: true,
            ),
            const Spacer(),
            AppButton(
              label: 'Login',
              onPressed: () {
                debugPrint('login');
              },
            ),
            AppButton(
              label: 'Register',
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Column _welcomeTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Kliq News!",
          style: context.textTheme.displaySmall,
        ),
        Text(
          "Get the latest news, top stories and more 📰",
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
