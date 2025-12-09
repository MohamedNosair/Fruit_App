import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/order_summary_widget.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/payment_item.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
    required this.pageController,
    required this.currentPage,
  });
  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    var s = S.current;
    var orderEntity = context.read<OrderEntity>().shippingAddressEntity!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OrderSummryWidget(),
        PaymentItem(
          child: Column(
            children: [
              Row(
                children: [
                  Text(s.delivery_address, style: TextStyles.font13BoldGray950),
                  Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      pageController.animateToPage(
                        currentPage - 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    icon: Icon(Icons.edit, color: AppColors.gray600),
                    label: Text(
                      s.edit,
                      style: TextStyles.font13SemiBoldGray600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on_rounded, color: AppColors.gray950),
                  Text(
                    '${orderEntity.city} ${orderEntity.address} ${orderEntity.addressDetails}',
                    style: TextStyles.font13SemiBoldGray600.copyWith(
                      color: AppColors.gray950,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
