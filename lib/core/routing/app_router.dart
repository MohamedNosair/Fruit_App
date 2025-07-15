import 'package:flutter/material.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/features/auth/login/ui/login_view.dart';
import 'package:fruit_app/features/auth/sign_up/sign_up_view.dart';
import 'package:fruit_app/features/on_boarding/ui/on_boarding_view.dart';
import 'package:fruit_app/features/splash/ui/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpView:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      default:
        return null;
    }
  }
}
