import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kliq_news_app/config/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      router.pushAndPopUntil(const LoginRoute(),predicate: (route) => false,);
      } else {
        resolver.next(true);
      }
    });
  }
}
