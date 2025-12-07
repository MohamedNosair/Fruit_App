import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/features/home/presentation/widgets/best_seller_sliver_grid.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),

      child: CustomScrollView(
        slivers: [const BestSellerSliverGrid(products:[])],
      ),
    );
  }
}
