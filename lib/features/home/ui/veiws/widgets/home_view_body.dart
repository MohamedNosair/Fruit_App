import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/search_text_field.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_seller_sliver_grid.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_selling_header.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/custom_home_app_bar.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/featured_item_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 10.h,
              children: [
                CustomHomeAppBar(),
                Column(
                  spacing: 16.h,
                  children: [
                    SearchTextField(),
                    const FeaturedItemList(),
                    BestSellingHeader(),
                    heightSpace(4),
                  ],
                ),
              ],
            ),
          ),

          const BestSellerSliverGrid(),
        ],
      ),
    );
  }
}
