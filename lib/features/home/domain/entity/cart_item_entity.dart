import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, required this.quantity});

  num totalPrice() {
    return productEntity.price * quantity;
  }

  num totalWeight() {
    return productEntity.unitAmount * quantity;
  }

  increasQuantity() {
    quantity++;
  }

  int decreasQuantity() {
    return quantity--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
