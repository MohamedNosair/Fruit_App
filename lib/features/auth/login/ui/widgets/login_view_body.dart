import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/or_custom_divider.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:fruit_app/features/auth/login/ui/widgets/forget_password.dart';
import 'package:fruit_app/features/auth/login/ui/widgets/login_with_social_media.dart';
import 'package:fruit_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          spacing: 16.h,
          children: [
            CustomTextFormField(
              hintText: S.current.email,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              hintText: S.current.password,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye, color: AppColors.black40),
                onPressed: () {},
              ),
            ),
           const ForgetPassword(),

            heightSpace(16),
            CustomButtom(text: S.current.login, onPressed: () {},),
            //// create account
            const DontHaveAccount(),
            heightSpace(17),
            const OrCustomDivider(),
            const LoginWithSocialMedia(),
          ],
        ),
      ),
    );
  }
}
