import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/font_weight_helper.dart';

class TextStyles {
 
  static TextStyle font13semiBoldGray500 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.gray500,
  );
  static TextStyle font13regularGray400 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.gray400,
  );
  static TextStyle font23BoldGreen = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.mainColor,
  );
  static TextStyle font23BoldGray950 = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.gray950,
  );
  static TextStyle font23BoldOrange = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.orange,
  );
}
