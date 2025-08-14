import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(AppImages.profileImage, fit: BoxFit.cover),
       
        backgroundColor: Colors.transparent,
        radius: 30,
      ),

      title: Text(getGreeting(), style: TextStyles.font16RegularGray400),
      subtitle: Text('Mohamed nosair', style: TextStyles.font16SemiBoldGray950),
      trailing: CircleAvatar(
        child: SvgPicture.asset(AppImages.notification, fit: BoxFit.cover),
        backgroundColor: AppColors.green50,
        radius: 20.r,
      ),
    );
  }

  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour >= 12) {
      return S.current.goodEvening;
    } else {
      return S.current.goodMorning;
    }
  }
}
