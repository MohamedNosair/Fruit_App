import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';

void customSnackBar(
 {required BuildContext context,
  required String message,
  required IconData icon,
  required Color backgroundColor,}
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          widthSpace(10),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}
