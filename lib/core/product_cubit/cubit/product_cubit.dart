
import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  final ProductRepo productRepo;

  int productLength = 0;
  Future<void> getAllProducts() async {
    emit(ProductLoadingState());
    final result = await productRepo.getProducts();
    result.fold((failure) => emit(ProductFailureState(failure.message)), (
      products,
    ) {
      productLength = products.length;

      emit(ProductSuccessState(products));
    });
  }

  Future<void> getAllBestSellingProducts() async {
    emit(ProductLoadingState());
    final result = await productRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductFailureState(failure.message)), (
      products,
    ) {
      emit(ProductSuccessState(products));
    });
  }
}
