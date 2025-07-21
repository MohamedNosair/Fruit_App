import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/or_custom_divider.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/dont_and_have_account.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/forget_password.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/login_with_social_media.dart';
import 'package:fruit_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
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
            CustomButtom(text: S.current.login, onPressed: () {}),
            //// create account
            DontAndHaveAccount(
              onTap: () {
                Navigator.pushNamed(context, Routes.signUpView);
              },
              textPartOne: S.current.dontHaveAnAccount,
              textPartTwo: S.current.createAccount,
            ),
            heightSpace(17),
            const OrCustomDivider(),
            const LoginWithSocialMedia(),
          ],
        ),
      ),
    );
  }
}
