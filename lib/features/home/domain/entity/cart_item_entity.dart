import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  ProductEntity productEntity;
  int count;
  CartItemEntity({required this.productEntity, required this.count});

  num totalPrice() {
    return productEntity.price * count;
  }

  num totalWeight() {
    return productEntity.unitAmount * count;
  }

  increasCount() {
    count++;
  }

 int decreasCount() {
   return count--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
