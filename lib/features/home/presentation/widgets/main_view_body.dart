import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/veiws/Products_view.dart';
import 'package:fruit_app/features/home/presentation/veiws/cart_view.dart';
import 'package:fruit_app/features/home/presentation/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          ProductsView(),
          CartView(),
          // const CartView(),
        ],
      ),
    );
  }
}