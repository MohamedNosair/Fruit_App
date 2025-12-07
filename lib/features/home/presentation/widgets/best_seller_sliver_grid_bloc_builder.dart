import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entities/product_dummy_data_entity.dart';
import 'package:fruit_app/core/product_cubit/cubit/product_cubit.dart';
import 'package:fruit_app/core/widgets/custom_error_widget.dart';
import 'package:fruit_app/features/home/presentation/widgets/best_seller_sliver_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerSliverGridBlocBuilder extends StatelessWidget {
  const BestSellerSliverGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return Skeletonizer.sliver(
            child: BestSellerSliverGrid(products: getDummyData()),
          );
        } else if (state is ProductFailureState) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errorMessage),
          );
        } else if (state is ProductSuccessState) {

          return BestSellerSliverGrid(products: state.products );
        } else {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: 'Unexpected error occurred'),
          );
        }
      },
    );
  }
}
