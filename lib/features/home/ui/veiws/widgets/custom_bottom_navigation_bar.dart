import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/features/home/domain/entity/bottom_navigation_bar_entity.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarItems.asMap().entries.map((item) {
          int index = item.key;
          return Expanded(
            flex: selectedIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: NavigationBarItem(
                isSelected: index == selectedIndex,
                item: item.value,
              ),
            ),
          );
        }).toList(),
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.1),

            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0, // Shadow below the bar
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
      ),
    );
  }
}
