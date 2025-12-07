import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/active_step_item.dart';
import 'package:fruit_app/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(child: ActiveStepItem(stepName:getSteps()[index] ,));
      }),
    );
  }

  List<String> getSteps() {
    final names = S.current;
    return [names.shipping, names.address, names.payment, names.review];
  }
}
