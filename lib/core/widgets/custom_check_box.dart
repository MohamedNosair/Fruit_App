import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  const CustomCheckBox({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      
      duration: Duration(microseconds: 300),
      curve: Curves.easeInOut,
      width: 24.w,
      height: 24.h,
      decoration: ShapeDecoration(
        color: isChecked ? AppColors.mainColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(
            width: 1.5.w,
            color: isChecked ? Colors.transparent : Color(0xffDDDFDF),
          ),
        ),
      
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: isChecked ? SvgPicture.asset(AppImages.right) : SizedBox(),
      ),
    );
  }
}
