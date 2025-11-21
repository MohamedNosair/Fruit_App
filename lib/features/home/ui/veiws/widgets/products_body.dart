import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/product_cubit/cubit/product_cubit.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_header.dart';
import 'package:fruit_app/core/widgets/search_text_field.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_seller_sliver_grid_bloc_builder.dart';

import 'package:fruit_app/generated/l10n.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getAllProducts();
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
              AppBarCustom(
                text: S.current.products,
                showBackButton: false,
                showNotificationIcon: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Column(
                  spacing: 16.h,
                  children: [
                    const SearchTextField(),
                    CustomHeader(title: S.current.products),
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
