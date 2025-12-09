import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';

class OrderProductModel {
  final int quantity;
  final String name;
  final String code;
  final double price;

  OrderProductModel({
    required this.price,
    required this.quantity,
    required this.name,
    required this.code,
  });
  factory OrderProductModel.fromCartItemEntity(CartItemEntity entity) {
    return OrderProductModel(
      quantity: entity.quantity,
      name: entity.productEntity.name,
      code: entity.productEntity.code,
      price: entity.productEntity.price.toDouble(),
    );
  }
  toJson() {
    return {"quantity": quantity, "name": name, "code": code};
  }
}
