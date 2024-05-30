import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_button.dart';
import 'package:kliq_news_app/core/global/widgets/app_text_field.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:kliq_news_app/core/resources/ui_helper.dart';

@RoutePage()
class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

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
              hintText: 'Kabin Manandhar',
              label: 'Name',
              hidePadding: true,
            ),
            uiHelper.sHeight,
            const AppTextField(
              hintText: 'kabinmanandhar@outlook.com',
              label: 'Email',
              hidePadding: true,
            ),
            uiHelper.sHeight,
            const AppTextField(
              isObscure: true,
              hintText: '*********',
              label: 'Password',
              hidePadding: true,
            ),
            uiHelper.sHeight,
            const AppTextField(
              isObscure: true,
              hintText: '*********',
              label: 'Confirm Password',
              hidePadding: true,
            ),
            const Spacer(),
            AppButton(
              label: 'Register',
              onPressed: () {
                // context.router.push(const RegisterRoute());
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
          "Register to be a part of Kliq News 📰",
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
