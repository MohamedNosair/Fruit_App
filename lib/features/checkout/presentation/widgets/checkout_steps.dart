import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/step_item.dart';
import 'package:fruit_app/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  CheckoutSteps({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.formKey,
    required this.valueNotifier,
  });
  int currentPage;
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              var orderEntity = context.read<OrderEntity>();
              if (currentPage == 0) {
                handleShippingValidation(orderEntity, index, context);
              } else if (currentPage == 1) {
                orderEntity.handleAddressValidation(
                  context,
                  formKey,
                  pageController,
                  valueNotifier,
                );
              }
            },

            child: StepItem(
              index: index + 1,
              isActive: index <= currentPage,
              text: getSteps()[index],
            ),
          ),
        );
      }),
    );
  }

  void handleShippingValidation(
    OrderEntity orderEntity,
    int index,
    BuildContext context,
  ) {
    if (orderEntity.payWithCash != null) {
      pageController.animateToPage(
        index,
        duration: Duration(microseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      customSnackBar(
        context: context,
        message: S.current.buy_now_pay_later,
        icon: Icons.payment,
        backgroundColor: AppColors.lightMainColor,
      );
    }
  }
}

List<String> getSteps() {
  final names = S.current;
  return [names.shipping, names.address, names.payment];
}
