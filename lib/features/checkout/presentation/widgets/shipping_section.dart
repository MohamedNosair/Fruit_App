import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/shipping_item_section.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    final s = S.current;
    return Column(
      spacing: 8.h,
      children: [
        ShippingItemSection(
          onTap: () {
            currentIndex = 0;
            setState(() {});
            orderEntity.payWithCash = true;
          },
          isSelected: currentIndex == 0,
          title: s.cash,
          subtitle: s.delivery_from_the_location,
          price: '${orderEntity.cartItem.calculateTotalPrice() + 30}',
        ),
        ShippingItemSection(
          onTap: () {
            currentIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          isSelected: currentIndex == 1,
          title: s.online,
          subtitle: s.buy_now_pay_later,
          price: orderEntity.cartItem.calculateTotalPrice().toString(),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
