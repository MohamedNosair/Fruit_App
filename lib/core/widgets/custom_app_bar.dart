import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';
// import 'package:fruit_app/core/utils/extension.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text, style: TextStyles.font19BoldGray950),
      actions: [
        text.contains(S.current.login) || text.contains(S.current.signUp)
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: CircleAvatar(
                  child: SvgPicture.asset(
                    AppImages.notification,
                    fit: BoxFit.cover,
                  ),
                  backgroundColor: AppColors.green50,
                  radius: 20.r,
                ),
              ),
      ],
      leading: text.toLowerCase().contains(S.current.login)
          ? null
          : IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
