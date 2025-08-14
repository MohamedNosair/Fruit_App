import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/features/home/ui/veiws/widgets/featured_item.dart';

class FeaturedItemList extends StatelessWidget {
  const FeaturedItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const FeaturedItem();
        },
      ),
    );
  }
}
