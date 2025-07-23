import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/utils/extension.dart';
import 'package:fruit_app/core/widgets/custom_show_dialog.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/features/auth/ui/logic/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/features/auth/ui/views/widgets/siginup_widgets/sign_up_view_body.dart';
import 'package:fruit_app/generated/l10n.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoadingState) {
          LoadingDialog.show(context);
        } else if (state is SignupSuccessState) {
          context.pop();
          customSnackBar(
            context: context,
            message: S.current.welcomeName,
            icon: Icons.fork_right,
            backgroundColor: Colors.green,
          );
        } else if (state is SignupErrorState) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.message,
            icon: Icons.error,
            backgroundColor: Color.fromARGB(255, 192, 10, 10),
          );
        }
      },
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
