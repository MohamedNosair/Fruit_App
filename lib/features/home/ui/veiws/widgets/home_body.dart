import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/product_cubit/cubit/product_cubit.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/search_text_field.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_seller_sliver_grid_bloc_builder.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_selling_header.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/custom_home_app_bar.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/featured_item_list.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getAllBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            spacing: 10.h,
            children: [
              CustomHomeAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Column(
                  spacing: 16.h,
                  children: [
                    SearchTextField(),
                    const FeaturedItemList(),
                    BestSellingHeader(),
                    heightSpace(4),
                  ],
                ),
              ),
            ],
          ),
        ),

        const BestSellerSliverGridBlocBuilder(),
      ],
    );
  }
}
