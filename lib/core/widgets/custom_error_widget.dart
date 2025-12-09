import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String text;
  const CustomErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
