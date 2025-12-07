import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/checkout_body_view.dart';
import 'package:fruit_app/generated/l10n.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        showBackButton: true,
        showNotificationIcon: false,
        text: S.current.shipping,
      ),
      body: CheckoutBodyView(),
    );
  }
}
