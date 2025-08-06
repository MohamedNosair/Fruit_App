import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/routing/routes.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/core/widgets/custom_show_dialog.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/features/auth/ui/logic/signin_cubit/signin_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/signin_widgets/signin_view_body.dart';
import 'package:fruit_app/generated/l10n.dart';

class SigininViewBodyBlocConsumer extends StatelessWidget {
  const SigininViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
        if (state is SigninLoadingState) {
          LoadingDialog.show(context);
        } else if (state is SigninSuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeView,
            (route) => false,
          );
          context.pop();
          customSnackBar(
            context: context,
            message: S.current.welcomeName,
            icon: Icons.fork_right,
            backgroundColor: Colors.green,
          );
        } else if (state is SigninErrorState) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.message,
            icon: Icons.error,
            backgroundColor: Color.fromARGB(255, 192, 10, 10),
          );
        }},
      builder: (context, state) {
        return SigninViewBody();
      },
    );
  }
}
