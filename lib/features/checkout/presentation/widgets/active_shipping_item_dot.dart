import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w,
      height: 18.h,

      decoration: ShapeDecoration(
        color: AppColors.mainColor,
        shape: OvalBorder(
          side: BorderSide(width: 4.w, color: Colors.white),
        ),
      ),
    );
  }
}