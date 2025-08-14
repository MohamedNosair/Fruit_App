import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/app_text.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/generated/l10n.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(AppImages.avocado, fit: BoxFit.cover),
                const SizedBox(height: 24),
                ListTile(
                  title: AppText(
                    text: 'بطيخ',
                    style: TextStyles.font16SemiBoldGray950,
                  ),
                  subtitle: AppText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '50 ${S.current.eg}',
                          style: TextStyles.font13BoldOrange,
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.font13BoldOrange.copyWith(
                            color: AppColors.lightOrange,
                          ),
                        ),

                        TextSpan(
                          text: S.current.kg,
                          style: TextStyles.font13semiBoldlightOrange,
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: AppColors.green500,

                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
