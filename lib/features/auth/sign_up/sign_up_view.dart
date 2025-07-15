import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/sign_up/widgets/sign_up_view_body.dart';
import 'package:fruit_app/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(text: S.current.signUp),
      body: SignUpViewBody(),
    );
  }
}
