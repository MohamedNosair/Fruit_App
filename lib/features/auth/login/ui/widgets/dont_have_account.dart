import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: S.current.dontHaveAnAccount,
            style: TextStyles.font16SemiBoldGray600,
          ),
          TextSpan(
            onEnter: (e) {},
            text: S.current.createAccount,
            style: TextStyles.font16SemiBoldGreen500,
          ),
        ],
      ),
    );
  }
}
