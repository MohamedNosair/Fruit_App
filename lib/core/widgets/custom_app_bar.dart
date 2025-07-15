import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/extension.dart';
// import 'package:fruit_app/core/utils/extension.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text, style: TextStyles.font19BoldGray950),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
// AppBar appBarCustom({required String text}) {
//   return 
// }
