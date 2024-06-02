import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_news_app/app/auth/provider/auth_notifier_provider.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/global/widgets/app_button.dart';
import 'package:kliq_news_app/core/global/widgets/app_text_field.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:kliq_news_app/core/resources/ui_helper.dart';
import 'package:kliq_news_app/core/resources/validators.dart';

@RoutePage()
class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          // Navigate to any screen
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Authenticated'),
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.router.pushAndPopUntil(
            const HomeRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (message) {
          EasyLoading.showError('Registration Failed');

          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message!),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      );
    });
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
            uiHelper.sHeight,
            AppTextField(
              hintText: 'johndoe@kliqnews.com',
              label: 'Email',
              validator: AppValidators.validateEmail,
              controller: emailController,
              hidePadding: true,
            ),
            uiHelper.sHeight,
            AppTextField(
              isObscure: true,
              hintText: '*********',
              label: 'Password',
              validator: AppValidators.validatePassword,
              controller: passwordController,
              hidePadding: true,
            ),
            uiHelper.sHeight,
            AppTextField(
              isObscure: true,
              hintText: '*********',
              validator: (p0) {
                return AppValidators.validateConfirmPassword(
                    p0, passwordController.text);
              },
              label: 'Confirm Password',
              hidePadding: true,
            ),
            const Spacer(),
            AppButton(
              label: 'Register',
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signup(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                EasyLoading.show(status: 'Registering...');
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
