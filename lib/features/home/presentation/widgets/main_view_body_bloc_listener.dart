import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/custom_snackbar.dart';
import 'package:fruit_app/features/home/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/widgets/main_view_body.dart';
import 'package:fruit_app/generated/l10n.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          customSnackBar(
            context: context,
            message: S.current.add_success,
            icon: Icons.shopping_cart_rounded,
            backgroundColor: Colors.green,
          );
        } else if (state is CartItemRemoved) {
          customSnackBar(
            context: context,
            message: S.current.delete_success,
            icon: Icons.delete_rounded,
            backgroundColor: Colors.red,
          );
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
