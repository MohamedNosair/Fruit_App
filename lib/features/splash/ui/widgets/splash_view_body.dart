import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(AppImages.plant)],
        ),

        SvgPicture.asset(AppImages.fruit),

        SvgPicture.asset(AppImages.Circles, fit: BoxFit.fill),
      ],
    );
  }
}
