import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/login_view_body.dart';
import 'package:fruit_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarCustom(text: S.current.login,) ,
      body: LoginViewBody(),
    );
  }
}
