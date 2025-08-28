import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/core/utils/get_user.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: getDataOfUser().imageUrl.isNullOrEmpty() ?  AssetImage(AppImages.profileImage) : NetworkImage(getDataOfUser().imageUrl),
        backgroundColor: Colors.transparent,
        radius: 20.r,
      ),

      title: Text(getGreeting(), style: TextStyles.font16RegularGray400),
      subtitle: Text(
        '${getDataOfUser().name}',
        style: TextStyles.font16SemiBoldGray950,
      ),

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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
