import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/active_step_item.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(text: text),
      secondChild: ActiveStepItem(stepName: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(
        microseconds: 300
      ),
    );
  }
}
