import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/generated/l10n.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green50,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Center(
        child: Text(
          S.current.you_have + " 3 " + S.current.products_in_your_shopping_cart,
          style: TextStyles.font13RegularGreen,
        ),
      ),
    );
  }
}
