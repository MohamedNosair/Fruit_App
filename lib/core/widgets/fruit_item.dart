import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/app_text.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/fade_in_network_image.dart';
import 'package:fruit_app/features/home/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/generated/l10n.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity product;
  const FruitItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  flex: 5,
                  child: FadeInNetworkImage(imageUrl: product.imageUrl!),
                ),
                SizedBox(height: 24.h),
                ListTile(
                  title: AppText(
                    text: product.name,
                    style: TextStyles.font16SemiBoldGray950,
                  ),
                  subtitle: AppText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price} ${S.current.eg}',
                          style: TextStyles.font13BoldOrange,
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.font13BoldOrange.copyWith(
                            color: AppColors.lightOrange,
                          ),
                        ),

                        TextSpan(
                          text: S.current.kg,
                          style: TextStyles.font13semiBoldlightOrange,
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProduct(product);
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.green500,

                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
