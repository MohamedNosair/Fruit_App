import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/utils/app_paypal_keys.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_app/features/checkout/presentation/logic/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/checkout_steps.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/checkout_steps_page_view.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class CheckoutBodyView extends StatefulWidget {
  const CheckoutBodyView({super.key});

  @override
  State<CheckoutBodyView> createState() => _CheckoutBodyViewState();
}

class _CheckoutBodyViewState extends State<CheckoutBodyView> {
  late PageController pageController;
  int currentPage = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          heightSpace(20),
          CheckoutSteps(
            formKey: formKey,
            valueNotifier: valueNotifier,
            currentPage: currentPage,
            pageController: pageController,
          ),
          heightSpace(20),
          Expanded(
            child: CheckOutStepsPageView(
              currentPage: currentPage,
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            text: getNextButtonText(currentPage),
            onPressed: () {
              var orderEntity = context.read<OrderEntity>();
              if (currentPage == 0) {
                orderEntity.handleShippingValidation(context, pageController);
              } else if (currentPage == 1) {
                orderEntity.handleAddressValidation(
                  context,
                  formKey,
                  pageController,
                  valueNotifier,
                );
              } else {
                processPayment(context, orderEntity);
              }
            },
          ),
          heightSpace(50),
        ],
      ),
    );
  }

  String getNextButtonText(int currentPage) {
    switch (currentPage) {
      case 0:
        return S.current.next;
      case 1:
        return S.current.next;
      case 2:
        return S.current.confirm;
      default:
        return S.current.next;
    }
  }

  void processPayment(BuildContext context, orderEntity) {
    var order = context.read<OrderEntity>();
    var addOrderCubit = context.read<AddOrderCubit>();
    PaypalPaymentEntity paymentEntity = PaypalPaymentEntity.fromEntity(order);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretKey,
          transactions: [paymentEntity.tojson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            addOrderCubit.addOrder(orderEntity);
            customSnackBarSuccess(context: context, text: "Success");
            Navigator.pop(context);
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
