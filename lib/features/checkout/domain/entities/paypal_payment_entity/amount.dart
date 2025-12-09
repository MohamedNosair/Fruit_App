import 'package:fruit_app/core/utils/get_currency.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity order) {
    return Amount(
      total: order.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(order),
    );
  }
  Map<String, dynamic> toJson() {
    return {"total": total, "currency": currency, "details": details!.toJson()};
  }
}
