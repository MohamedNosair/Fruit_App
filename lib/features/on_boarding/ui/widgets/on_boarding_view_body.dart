import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/features/on_boarding/ui/widgets/on_boarding_page_view.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: OnBoardingPageView(pageController: pageController),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: currentPage == 0
                ? AppColors.mainColor.withOpacity(0.5)
                : AppColors.mainColor,
            color: AppColors.mainColor,
          ),
        ),
        heightSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Visibility(
            visible: currentPage == 1,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            maintainInteractivity: true,
            maintainSemantics: true,
            child: CustomButtom(
              text: S.of(context).startNow,
              onPressed: () {
                // storage.writeBool(kIsOnBoardingViewSeen, true);
                GetStorage().write(kIsOnBoardingViewSeen, true);
                context.pushReplacementNamed(Routes.loginView);
              },
            ),
          ),
        ),
        heightSpace(40),
      ],
    );
  }
}
