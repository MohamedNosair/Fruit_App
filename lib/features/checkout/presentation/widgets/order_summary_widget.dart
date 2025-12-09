import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/payment_item.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final order = context.read<OrderEntity>();
    return PaymentItem(
      title: S.current.summary,
      child: Column(
        spacing: 8.w,

        children: [
          Row(
            children: [
              Text(S.current.subtotal, style: TextStyles.font13regularGray500),
              Spacer(),
              Text(
                "${order.cartItem.calculateTotalPrice()} ${S.current.eg} ",
                style: TextStyles.font16semiBoldGray500,
              ),
            ],
          ),
          Row(
            children: [
              Text(S.current.delivery, style: TextStyles.font13regularGray500),
              Spacer(),
              Text(
                "${order.calculateShippingCost()} ${S.current.eg} ",
                style: TextStyles.font13semiBoldGray500,
              ),
            ],
          ),
          Divider(height: 18, color: AppColors.gray200),
          Row(
            children: [
              Text(S.current.total, style: TextStyles.font16SemiBoldGray950),
              Spacer(),
              Text(
                "${order.calculateTotalPriceAfterDiscountAndShipping()} ${S.current.eg} ",
                style: TextStyles.font16SemiBoldGray950,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
