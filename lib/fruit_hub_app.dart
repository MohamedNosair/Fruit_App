import 'package:flutter/material.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/features/splash/ui/splash_view.dart';

class FruitHubApp extends StatelessWidget {
   FruitHubApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      onGenerateRoute:appRouter.generateRoute,
    );
  }
}
