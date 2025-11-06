part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoadingState extends ProductState {}
final class ProductSuccessState extends ProductState {
  final List<ProductEntity> products;
  ProductSuccessState(this.products);
}
final class ProductFailureState extends ProductState {
  final String errorMessage;
  ProductFailureState(this.errorMessage);
}
