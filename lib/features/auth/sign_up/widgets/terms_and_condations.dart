import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_check_box.dart';
import 'package:fruit_app/generated/l10n.dart';

class TermsAndCondations extends StatefulWidget {
  const TermsAndCondations({super.key});

  @override
  State<TermsAndCondations> createState() => _TermsAndCondationsState();
}

class _TermsAndCondationsState extends State<TermsAndCondations> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        GestureDetector(
          onTap: () {
            isChecked = !isChecked;
            setState(() {});
          },
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
