import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_app/features/home/domain/entity/cart_Entity.dart';
import 'package:fruit_app/generated/l10n.dart';

class OrderEntity {
  final CartEntity cartItem;
  final String uID;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();
  bool? payWithCash;

  OrderEntity(this.cartItem, {required this.uID, this.payWithCash});

  calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  calculateShippingDiscount() {
    return 0;
  }

  calculateTotalPriceAfterDiscountAndShipping() {
    return cartItem.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }

 

  void handleShippingValidation(BuildContext context, pageController) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
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

  void handleAddressValidation(
    BuildContext context,
    GlobalKey<FormState> formKey,
    pageController,
    valueNotifier,
  ) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }
}
