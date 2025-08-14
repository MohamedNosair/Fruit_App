import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 28.w),
        ),
        onPressed: () {},
        child: Text(S.current.shopNow, style: TextStyles.font13BoldGreen),
      ),
    );
  }
}
