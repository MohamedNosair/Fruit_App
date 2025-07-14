import 'package:flutter/material.dart';
import 'package:fruit_app/core/themes/styles.dart';

AppBar appBarCustom({required String text}) {
  return AppBar(
    centerTitle: true,
    title: Text(text, style: TextStyles.font19BoldGray950),
    leading: GestureDetector(
    
      onTap: () {},
      child: IconButton(
        
        onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
    ),
  );
}
