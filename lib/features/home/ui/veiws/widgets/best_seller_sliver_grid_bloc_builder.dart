import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entities/product_dummy_data_entity.dart';
import 'package:fruit_app/core/product_cubit/cubit/product_cubit.dart';
import 'package:fruit_app/core/widgets/custom_error_widget.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/best_seller_sliver_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerSliverGridBlocBuilder extends StatelessWidget {
  const BestSellerSliverGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return BestSellerSliverGrid(products: state.products);
        } else if (state is ProductFailureState) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errorMessage),
          );
        } else {
          return Skeletonizer.sliver(
            child: BestSellerSliverGrid(products: getDummyData()),
          );
        }
      },
    );
  }
}
