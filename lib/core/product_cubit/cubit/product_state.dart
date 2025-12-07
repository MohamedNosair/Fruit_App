part of 'product_cubit.dart';

@immutable
sealed class ProductStates {}

final class ProductInitial extends ProductStates {}

final class ProductLoadingState extends ProductStates {}
final class ProductSuccessState extends ProductStates {

  final List<ProductEntity> products;
  ProductSuccessState(this.products, );
}

final class ProductFailureState extends ProductStates {
  final String errorMessage;
  ProductFailureState(this.errorMessage);
}



final class IndexChangedState extends ProductStates {
  final int index;
  IndexChangedState(this.index);
}


