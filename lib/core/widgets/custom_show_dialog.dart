import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // علشان المستخدم ميقفلش الديالوج بالضغط بالخلفية
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
