import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/home/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/veiws/Products_view.dart';
import 'package:fruit_app/features/home/presentation/veiws/cart_view.dart';
import 'package:fruit_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/widgets/home_view.dart';
import 'package:fruit_app/features/home/presentation/widgets/main_view_body.dart';
import 'package:fruit_app/features/home/presentation/widgets/main_view_body_bloc_listener.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: MainViewBodyBlocListener(currentIndex: currentIndex),
      ),
    );
  }
}




