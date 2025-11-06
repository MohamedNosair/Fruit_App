import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:fruit_app/features/auth/ui/logic/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/siginup_widgets/signup_view_bloc_consumer.dart';
import 'package:fruit_app/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(text: S.current.signUp),
      body: BlocProvider(
        create: (context) => SignupCubit(
          sl<AuthRepo>(),
        ),
        child: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
