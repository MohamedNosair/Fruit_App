import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';

class DontAndHaveAccount extends StatelessWidget {
  final String textPartOne, textPartTwo;
  final VoidCallback onTap;
  const DontAndHaveAccount({
    super.key,
    required this.textPartOne,
    required this.onTap,
    required this.textPartTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: textPartOne, style: TextStyles.font16SemiBoldGray600),
          WidgetSpan(child: widthSpace(3)),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: textPartTwo,
            style: TextStyles.font16SemiBoldGreen500,
          ),
        ],
      ),
    );
  }
}
