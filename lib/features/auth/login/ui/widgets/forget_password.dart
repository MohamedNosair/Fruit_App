import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Intl.getCurrentLocale() == 'ar'
          ? Alignment.topLeft
          : Alignment.topRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          S.current.forgetPassword,
          style: TextStyles.font13semiBoldlightMainColor,
        ),
      ),
    );
  }
}
