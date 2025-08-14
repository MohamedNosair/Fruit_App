import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: Intl.getCurrentLocale() == 'ar'
          ? TextAlign.right
          : TextAlign.left,
      style: style,
    );
  }

  static rich(TextSpan textSpan) {
    return Text.rich(
      textSpan,
      textAlign: Intl.getCurrentLocale() == 'ar'
          ? TextAlign.right
          : TextAlign.left,
    );
  }
}
