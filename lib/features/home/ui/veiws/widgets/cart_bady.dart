import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/cart_header.dart';
import 'package:fruit_app/generated/l10n.dart';

class CartBady extends StatelessWidget {
  const CartBady({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            spacing: 10.h,
            children: [
              AppBarCustom(
                text: S.current.cart,
                showBackButton: true,
                showNotificationIcon: false,
              ),
              const CartHeader(),
            ],
          ),
        ),
      ],
    );
  }
}
