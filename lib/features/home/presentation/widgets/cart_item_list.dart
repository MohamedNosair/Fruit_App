import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItemEntity});
  final List<CartItemEntity> cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Divider(color: AppColors.black40),
      ),
      itemCount: cartItemEntity.length,

      itemBuilder: (context, index) {
        return CartItem(cartItemEntity: cartItemEntity[index]);
      },
    );
  }
}
