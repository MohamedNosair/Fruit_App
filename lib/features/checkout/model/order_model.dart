import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/model/order_product_model.dart';
import 'package:fruit_app/features/checkout/model/shipping_address_model.dart';

class OrderModel {
  final String uID;
  final double totallPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String status;

  OrderModel({
    required this.status,
    required this.paymentMethod,
    required this.uID,
    required this.totallPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
  });
  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      paymentMethod: orderEntity.payWithCash! ? "cash" : "online",
      uID: orderEntity.uID,
      totallPrice: orderEntity.cartItem.calculateTotalPrice(),
      shippingAddressModel: ShippingAddressModel.fromEntity(
        orderEntity.shippingAddressEntity!,
      ),
      orderProducts: orderEntity.cartItem.cartItems
          .map((e) => OrderProductModel.fromCartItemEntity(e))
          .toList(), 
          status: "pending",
    );
  }

  toJson() {
    return {
      "uID": uID,
      "totallPrice": totallPrice,
      "status": status,
      "shippingAddressModel": shippingAddressModel.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod,
    };
  }
}
