import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';

import 'package:svg_flutter/svg_flutter.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image, text;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(width: 1.w, color: AppColors.black20),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          title: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyles.font16SemiBoldGray950,
          ),
          leading: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
