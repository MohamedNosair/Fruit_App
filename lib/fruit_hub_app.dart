import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/core/themes/app_theme.dart';
import 'package:fruit_app/features/splash/ui/splash_view.dart';
import 'package:fruit_app/generated/l10n.dart';

class FruitHubApp extends StatelessWidget {
  FruitHubApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: appTheme(),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale('ar'),
          debugShowCheckedModeBanner: false,
          home: SplashView(),
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
