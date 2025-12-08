import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/address_input_section.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/payment_section.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/shipping_section.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable, required this.currentPage,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.w),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPages(formKey, valueListenable, pageController,currentPage).length,
        itemBuilder: (context, index) {
          return getPages(formKey, valueListenable, pageController, currentPage)[index];
        },
      ),
    );
  }
}

List<Widget> getPages(
  GlobalKey<FormState> formKey,
  ValueListenable<AutovalidateMode> valueListenable,
  PageController pageController,
  int currentPage ,
) {
  return [
    ShippingSection(),
    AddressInputSection(formKey: formKey, valueListenable: valueListenable),
    PaymentSection(pageController: pageController ,currentPage: currentPage,),
  ];
}
