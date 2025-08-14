import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveNavigationBarItem extends StatelessWidget {
  final String image;
  const InActiveNavigationBarItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}
