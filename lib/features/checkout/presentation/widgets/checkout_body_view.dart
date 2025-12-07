import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/checkout_steps.dart';

class CheckoutBodyView extends StatelessWidget {
  const CheckoutBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CheckoutSteps()]);
  }
}
