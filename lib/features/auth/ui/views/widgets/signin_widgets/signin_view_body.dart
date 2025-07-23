import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/or_custom_divider.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/ui/logic/signin_cubit/signin_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/dont_and_have_account.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/forget_password.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/signin_with_social_media.dart';
import 'package:fruit_app/generated/l10n.dart';

class SigninViewBody extends StatefulWidget {
  SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigininViewBodyState();
}

class _SigininViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String password, emailAddress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
          child: Column(
            spacing: 16.h,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  emailAddress = value!;
                },
                hintText: S.current.email,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                 obscureText: context.watch<SigninCubit>().obscureText,
                onSaved: (value) {
                  password = value!;
                },
                hintText: S.current.password,
                textInputType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    context.watch<SigninCubit>().obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,

                    color: AppColors.black40,
                  ),
                  onPressed: () {
                    context.read<SigninCubit>().togglePasswordVisibility();
                  },
                ),
              ),
              const ForgetPassword(),

              heightSpace(16),
              CustomButtom(
                text: S.current.login,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signinWithEmailAndPassword(
                      password,
                      emailAddress,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
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
              const SigninWithSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
