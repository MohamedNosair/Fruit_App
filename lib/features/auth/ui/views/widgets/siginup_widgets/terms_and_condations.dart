import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_check_box.dart';
import 'package:fruit_app/generated/l10n.dart';

// ignore: must_be_immutable

class TermsAndCondations extends StatelessWidget {
  final void Function()? onTap;
  final bool  isChecked;

  const TermsAndCondations({super.key, this.onTap, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CustomCheckBox(isChecked: isChecked),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.current.byCreatingAnAccountYouAgreeTo,
                  style: TextStyles.font13SemiBoldGray600,
                ),
                WidgetSpan(child: widthSpace(2)),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigator.pushNamed(context, Routes.signUpView);
                    },
                  text: S.current.OurTermsAndConditions,
                  style: TextStyles.font13semiBoldlightMainColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
