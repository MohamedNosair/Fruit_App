import 'package:flutter/material.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:svg_flutter/svg.dart';
import 'package:intl/intl.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: Intl.getCurrentLocale() == 'ar'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [SvgPicture.asset(AppImages.plant)],
        ),

        SvgPicture.asset(AppImages.fruit),

        SvgPicture.asset(AppImages.Circles, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNavigation() async {
    bool isOnBoardingViewSeen =await storage.read(kIsOnBoardingViewSeen)?? false;
    String  isUserLoggedIn = await storage.read(kUserUid) ?? '';
    Future.delayed(Duration(seconds: 5), () {
      if (isUserLoggedIn.isNotNullOrNotEmpty()) {
        Navigator.pushReplacementNamed(context, Routes.homeView);
      } else if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, Routes.loginView);
      } else {
        Navigator.pushReplacementNamed(context, Routes.onBoardingView);
      }
      // if (isOnBoardingViewSeen) {
      //   Navigator.pushReplacementNamed(context, Routes.loginView);
      // } else {
      //   Navigator.pushReplacementNamed(context, Routes.onBoardingView);
      // }
    });
  }
}
