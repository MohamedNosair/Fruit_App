import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/features/auth/ui/logic/signin_cubit/signin_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/social_login_button.dart';
import 'package:fruit_app/generated/l10n.dart';

class SigninWithSocialMedia extends StatelessWidget {
  const SigninWithSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        SocialLoginButton(
          onPressed: () {
            context.read<SigninCubit>().signinWithGoogle();
          },
          image: AppImages.google,
          text: S.current.loginWithGoogle,
        ),
        SocialLoginButton(
          onPressed: () {},
          image: AppImages.apple,
          text: S.current.loginWithApple,
        ),
        SocialLoginButton(
          onPressed: () {},
          image: AppImages.facebook,
          text: S.current.loginWithFacebook,
        ),
      ],
    );
  }
}
