import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/widgets/fruit_item.dart';

class BestSellerSliverGrid extends StatelessWidget {
  final List<ProductEntity> products;
  final int currentIndex;

  const BestSellerSliverGrid({
    super.key,
    required this.products,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0.r),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
        ),
        itemBuilder: (context, index) {
          return FruitItem(product: products[index]);
        },
      ),
    );
  }
}
