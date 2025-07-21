import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/dont_and_have_account.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/terms_and_condations.dart';
import 'package:fruit_app/generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: Column(
          spacing: 16.h,
          children: [
            CustomTextFormField(
              hintText: S.current.name,
              textInputType: TextInputType.name,
            ),
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
            TermsAndCondations(),
            CustomButtom(text: S.current.createNewAccount, onPressed: () {}),
            DontAndHaveAccount(
              onTap: () {
                Navigator.pop(context);
              },
              textPartOne: S.current.alreadyHaveAnAccount,
              textPartTwo: S.current.login,
            ),
          ],
        ),
      ),
    );
  }
}
