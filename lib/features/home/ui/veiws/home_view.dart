import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
