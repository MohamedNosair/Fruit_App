import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';

class OrCustomDivider extends StatelessWidget {
  const OrCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        Expanded(child: Divider(height: 1, color: Color(0xffDDDFDF))),
        Text(S.current.or, style: TextStyles.font16SemiBoldGray950),
        Expanded(child: Divider(height: 1, color: Color(0xffDDDFDF))),
      ],
    );
  }
}
