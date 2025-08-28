import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_best_seller_sliver_grid.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_selling_header.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),

      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [heightSpace(24), BestSellingHeader(), heightSpace(8)],
            ),
          ),
          const CustomBestSellerSliverGrid(),
        ],
      ),
    );
  }
}
