import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';

class InactiveStepItem extends StatelessWidget {
  final String text;
  final int index;
  const InactiveStepItem({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 23.w,
          height: 23.h,
          decoration: BoxDecoration(
            color: AppColors.gray50,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text('${index}', style: TextStyles.font13BoldGray950),
          ),
        ),

        Text(text, style: TextStyles.font13semiBoldGray500),
      ],
    );
  }
}
