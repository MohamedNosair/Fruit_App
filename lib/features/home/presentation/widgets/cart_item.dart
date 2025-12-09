import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Container(
            width: 73.w,
            height: 92.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.colorBackgroundItemCart,
              borderRadius: BorderRadius.circular(12.r),
            ),

            child: Image.network("${cartItemEntity.productEntity.imageUrl}"),
          ),

          widthSpace(10),

          Expanded(
            child: Column(
              spacing: 6.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: TextStyles.font13BoldGray950,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeCartItem(
                          cartItemEntity,
                        );
                      },
                      excludeFromSemantics: true,
                      child: SvgPicture.asset(
                        AppImages.trash,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ],
                ),

                Text(
                  "${cartItemEntity.totalWeight()} كم",
                  style: TextStyles.font13BoldOrange,
                ),
                Row(
                  children: [
                    CartItemActionButtons(cartItemEntity: cartItemEntity),
                    Spacer(),
                    Text(
                      "${cartItemEntity.totalPrice()} جنيه",
                      style: TextStyles.font13BoldOrange,
                    ),
                  ],
                ),

                /// Buttons Row
              ],
            ),
          ),
        ],
      ),
    );
  }
}
