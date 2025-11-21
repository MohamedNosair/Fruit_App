import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/ui/veiws/Products_view.dart';
import 'package:fruit_app/features/home/ui/veiws/cart_view.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          selectedIndex = index;
          setState(() {});
          log('Selected Index: $selectedIndex');
        },
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            HomeView(),
            ProductsView(),
            CartView(),
            // const CartView(),
          ],
        ),
      ),
    );
  }
}
