import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/checkout_body_view.dart';
import 'package:fruit_app/features/home/domain/entity/cart_Entity.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView({super.key, required this.cartItem});
  CartEntity cartItem;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(widget.cartItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        showBackButton: true,
        showNotificationIcon: false,
        text: S.current.shipping,
      ),
      body: Provider.value(value: orderEntity, child: CheckoutBodyView()),
    );
  }
}
