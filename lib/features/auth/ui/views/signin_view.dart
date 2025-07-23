import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:fruit_app/features/auth/ui/logic/signin_cubit/signin_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/signin_view_body_bloc_consumer.dart';
import 'package:fruit_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(text: S.current.login),
      body: BlocProvider(
        create: (context) => SigninCubit(getIt<AuthRepo>()),
        child: SigininViewBodyBlocConsumer(),
      ),
    );
  }
}
