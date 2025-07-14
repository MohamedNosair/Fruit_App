import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/custom_divider.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:intl/intl.dart';

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


            Align(
              alignment: Intl.getCurrentLocale() == 'ar'
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  S.current.forgetPassword,
                  style: TextStyles.font13semiBoldlightMainColor,
                ),
              ),
            ),
            heightSpace(16),
            CustomButtom(text: S.current.login, onPressed: () {}),
            //// create account
          const DontHaveAccount(),
          OrCustomDivider()
          ],
        ),
      ),
    );
  }
}
