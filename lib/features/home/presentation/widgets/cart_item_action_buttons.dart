import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/logic/cart_cubit/cart_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ItemActionButton(
          backgroundIconColor: AppColors.mainColor,
          iconColor: Colors.white,
          onTap: () {
            cartItemEntity.increasQuantity();
            context.read<CartCubit>().updateCartItem(cartItemEntity);
          },
          icon: Icon(Icons.add, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(
            cartItemEntity.quantity.toString(),
            style: TextStyles.font16BoldGray950,
          ),
        ),
        ItemActionButton(
          backgroundIconColor: AppColors.green50,
          iconColor: AppColors.gray600,
          onTap: () {
            cartItemEntity.decreasQuantity() == 1
                ? context.read<CartCubit>().removeCartItem(cartItemEntity)
                : null;
            context.read<CartCubit>().updateCartItem(cartItemEntity);
          },
          icon: cartItemEntity.quantity == 1
              ? Icon(Icons.delete_rounded, color: AppColors.gray600)
              : Icon(Icons.remove),
        ),
      ],
    );
  }
}

class ItemActionButton extends StatelessWidget {
  const ItemActionButton({
    super.key,
    required this.backgroundIconColor,
    required this.iconColor,
    required this.onTap,
    required this.icon,
  });
  final Color backgroundIconColor;
  final Color iconColor;
  final VoidCallback onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: backgroundIconColor,
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        child: IconButton(onPressed: onTap, icon: icon, iconSize: 24.sp),
      ),
    );
  }
}
