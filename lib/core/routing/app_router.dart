import 'package:flutter/material.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/features/splash/ui/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );



      default:
        return null;
    }
  }
}