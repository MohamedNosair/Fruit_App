import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/app_color.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/core/widgets/custom_buttom.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/ui/logic/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/dont_and_have_account.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/siginup_widgets/terms_and_condations.dart';
import 'package:fruit_app/generated/l10n.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, password, emailAddress;
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 16.h,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: S.current.name,
                textInputType: TextInputType.name,
              ),

              CustomTextFormField(
                onSaved: (value) {
                  emailAddress = value!;
                },
                hintText: S.current.email,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                obscureText: context.watch<SignupCubit>().obscureText,
                onSaved: (value) {
                  password = value!;
                },
                hintText: S.current.password,
                textInputType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    context.watch<SignupCubit>().obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,

                    color: AppColors.black40,
                  ),
                  onPressed: () {
                    context.read<SignupCubit>().togglePasswordVisibility();
                  },
                ),
              ),
              TermsAndCondations(
                isChecked: isTermsAccepted,
                onTap: () {
                  isTermsAccepted = !isTermsAccepted;
                  setState(() {});
                },
              ),
              CustomButton(
                text: S.current.createNewAccount,
                onPressed: () {
                  if (isTermsAccepted) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            name,
                            password,
                            emailAddress,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    customSnackBar(
                      context: context,
                      message: S.current.OurTermsAndConditions,
                      icon: Icons.error,
                      backgroundColor: AppColors.lightMainColor,
                    );
                  }
                },
              ),
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
      ),
    );
  }
}
