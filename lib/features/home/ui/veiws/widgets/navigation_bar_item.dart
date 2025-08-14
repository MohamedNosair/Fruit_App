import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/domain/entity/bottom_navigation_bar_entity.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/active_navigation_bar.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/in_active_navigation_bar_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarEntity item;
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return  isSelected
            ? ActiveNavigationBar(image: item.activeImage, text: item.name)
            : InActiveNavigationBarItem(image: item.inActiveImage
      );
    
  }
}
