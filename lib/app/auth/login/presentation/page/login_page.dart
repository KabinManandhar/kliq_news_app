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
import 'package:kliq_news_app/core/global/widgets/app_theme_button.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';
import 'package:kliq_news_app/core/resources/services/connectivity/connectivity_status_provider.dart';
import 'package:kliq_news_app/core/resources/ui_helper.dart';
import 'package:kliq_news_app/core/resources/validators.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          // Navigate to any screen
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Logged In'),
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.router.pushAndPopUntil(
            const HomeRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (message) {
          EasyLoading.showError('Login Failed');
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message!),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      );
    });
    var connectivityStatus = ref.watch(connectivityStatusProvider);

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
    final UiHelper uiHelper = UiHelper();
    return BasePage(
      automaticallyImplyiLeading: false,
      titleWidget: TextButton(
        onPressed: () {
          context.router
              .pushAndPopUntil(WrapperRoute(), predicate: (_) => false);
        },
        child: const Text('Skip Login'),
      ),
      actions: const [ThemeToggleButton()],
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.padding14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            _welcomeTexts(context),
            uiHelper.mHeight,
            AppTextField(
              hintText: 'Email',
              label: 'Email',
              validator: AppValidators.validateEmail,
              controller: emailController,
              hidePadding: true,
            ),
            uiHelper.sHeight,
            AppTextField(
              hintText: 'Password',
              label: 'Password',
              isObscure: true,
              validator: AppValidators.validatePassword,
              controller: passwordController,
              hidePadding: true,
            ),
            const Spacer(),
            AppButton(
              label: 'Login',
              onPressed: () {
                ref.read(authNotifierProvider.notifier).login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                EasyLoading.show(status: 'Logging in...');
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
