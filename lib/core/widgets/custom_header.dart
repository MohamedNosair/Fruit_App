import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final int? productLength;
  const CustomHeader({super.key, required this.title, this.productLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${productLength != null ? ' $productLength' : ''} ${title}',
          style: TextStyles.font16BoldGray950,
        ),
        IconButton.outlined(
          style: IconButton.styleFrom(
            side: BorderSide(color: AppColors.black40), // حدود رمادية خفيفة
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding:  EdgeInsets.all(8.r), // مسافة داخلية متناسقة
            backgroundColor: Colors.white, // خلفية بيضاء ناعمة
          ),
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: AppColors.gray400, // لون الأيقونة
            size: 20, // حجم متوسط
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
