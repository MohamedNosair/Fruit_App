import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity order) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(order),
      description: "payment description",
      itemList: ItemList.fromEntity(items: order.cartItem.cartItems),
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "amount": amount!.toJson(),
      "description": description,
      "itemList": itemList!.toJson(),
    };
  }
}
