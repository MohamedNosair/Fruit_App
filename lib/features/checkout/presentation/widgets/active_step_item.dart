import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';

class ActiveStepItem extends StatelessWidget {
    final String stepName;
  const ActiveStepItem({super.key ,required this.stepName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.w,
      children: [
        Container(
          width: 23.w,
          height: 23.h,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white, size: 16.sp),
        ),

        Text(stepName, style: TextStyles.font13BoldGreen),
      ],
    );
  }
}
