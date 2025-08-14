import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/app_text.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:intl/intl.dart';

class ActiveNavigationBar extends StatelessWidget {
  final String image, text;

  const ActiveNavigationBar({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          right: Intl.getCurrentLocale() == 'ar' ? 0 : 20.w,
          left: Intl.getCurrentLocale() == 'ar' ? 20.w : 0,
        ),
        height: 30.h,
        decoration: BoxDecoration(
          color: Color(0XFFEEEEEE),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.green500,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            widthSpace(4),
            AppText(text: text, style: TextStyles.font11semiBoldGreen500),
          ],
        ),
      ),
    );
  }
}
