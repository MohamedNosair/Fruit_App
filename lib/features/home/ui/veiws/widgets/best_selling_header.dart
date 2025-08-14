import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.current.bestSeller, style: TextStyles.font16BoldGray950),
        Text(S.current.more, style: TextStyles.font13regularGray400),
      ],
    );
  }
}
