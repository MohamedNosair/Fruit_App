import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/features/on_boarding/ui/widgets/page_view_item.dart';
import 'package:fruit_app/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.visibility,
  });
  final PageController pageController;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          Image: AppImages.imagePageViewOne,
          backGround: AppImages.backgroundPageViewOne,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tr.welcome, style: TextStyles.font23BoldGray950),
              SizedBox(width: 8.w),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: tr.fruit, style: TextStyles.font23BoldGreen),
                    TextSpan(text: tr.hub, style: TextStyles.font23BoldOrange),
                  ],
                ),
              ),
            ],
          ),
          subTitle: tr.subTitlePageViewOne,
          visibility: visibility,
        ),

        PageViewItem(
          Image: AppImages.imagePageViewTwo,
          backGround: AppImages.backgroundPageViewTwo,
          title: Text(tr.searchAndShop, style: TextStyles.font23BoldGray950),
          subTitle: tr.subTitlePageViewTwo,
          visibility: visibility,
        ),
      ],
    );
  }
}
