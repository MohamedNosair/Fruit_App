import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_decoration.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';

class PaymentItem extends StatelessWidget {
  PaymentItem({super.key, this.title, required this.child});
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? '', style: TextStyles.font13BoldGray950),
        heightSpace(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
          decoration: AppDecoration.grayAppDecoration,
          child: child,
        ),
      ],
    );
  }
}
