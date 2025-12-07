import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/features/home/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/widgets/cart_header.dart';
import 'package:fruit_app/features/home/presentation/widgets/cart_item_list.dart';
import 'package:fruit_app/generated/l10n.dart';

class CartBady extends StatelessWidget {
  const CartBady({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 10.h,
                children: [
                  AppBarCustom(
                    text: S.current.cart,
                    showBackButton: false,
                    showNotificationIcon: false,
                  ),
                  const CartHeader(),
                  heightSpace(3),
                ],
              ),
            ),
            CartItemList(
              cartItemEntity: context.watch<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),

        Positioned(
          bottom: 20.h,
          left: 16.w,
          right: 16.w,
          child: CustomButton(
            text:
                'total ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} EG',
            onPressed: () {
              context.pushNamed(Routes.checkoutView);
            },
          ),
        ),
      ],
    );
  }
}
