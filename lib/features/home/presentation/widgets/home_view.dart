import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/product_cubit/cubit/product_cubit.dart';
import 'package:fruit_app/core/repo/product_repo.dart';

import 'package:fruit_app/features/home/presentation/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(sl<ProductRepo>()),
      child: HomeBody(),
    );
  }
}
