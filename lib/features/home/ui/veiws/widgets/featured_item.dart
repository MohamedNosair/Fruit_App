import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_text.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/featured_item_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:intl/intl.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    var isRTL = Intl.getCurrentLocale() == 'ar';
    return Container(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              left: isRTL ? 0 : itemWidth * .5,
              bottom: 0,
              top: 0,
              right: isRTL ? itemWidth * .5 : 0,
              child: Image.asset(AppImages.avocado, fit: BoxFit.cover),
            ),
            Transform.rotate(
              angle: isRTL ? 0 : math.pi,
              child: Container(
                width: itemWidth * .5,
                alignment: Intl.getCurrentLocale() == 'ar'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  image: DecorationImage(
                    image: svg.Svg(AppImages.backgroundOffers),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              // width: itemWidth * .5,
              // alignment: Intl.getCurrentLocale() == 'ar'
              //     ? Alignment.centerRight
              //     : Alignment.centerLeft,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(4.r),
              //   image: DecorationImage(
              //     image: svg.Svg(AppImages.backgroundOffers),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(25),
                    AppText(
                      text: 'عروض العيد',
                      style: TextStyles.font13regularWhite,
                    ),
                    heightSpace(8),
                    AppText(
                      text: 'خصم25%',
                      style: TextStyles.font19BoldGray950.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    heightSpace(7),
                    FeaturedItemButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
