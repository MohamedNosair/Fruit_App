import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderEntity order) {
    return DetailsEntity(
      shipping: order.calculateShippingCost().toString(),
      shippingDiscount: order.calculateShippingDiscount(),
      subtotal: order.cartItem.calculateTotalPrice().toString(),
    );
  }
}
