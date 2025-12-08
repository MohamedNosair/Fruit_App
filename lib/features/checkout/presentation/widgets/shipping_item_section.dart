import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/active_shipping_item_dot.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/inactive_shipping_item_dot.dart';
import 'package:fruit_app/generated/l10n.dart';

class ShippingItemSection extends StatelessWidget {
  const ShippingItemSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    required this.price,
  });
  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.mainColor : Colors.transparent,
          ),
        ),

        child: IntrinsicHeight(
          child: Row(
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              widthSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.font16SemiBoldGray950.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  heightSpace(6),
                  Text(
                    subtitle,
                    style: TextStyles.font13semiBoldGray500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '${price} ${S.current.eg}',
                  style: TextStyles.font16BoldWhite.copyWith(
                    color: AppColors.green500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
