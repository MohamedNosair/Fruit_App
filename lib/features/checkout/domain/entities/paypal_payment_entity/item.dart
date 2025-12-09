import 'package:fruit_app/core/utils/get_currency.dart';
import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory ItemEntity.fromEntity({required CartItemEntity itemEntity}) {
    return ItemEntity(
      name: itemEntity.productEntity.name,
      price: itemEntity.productEntity.price.toString(),
      quantity: itemEntity.quantity,
      currency: getCurrency(),
    );
  }
}
