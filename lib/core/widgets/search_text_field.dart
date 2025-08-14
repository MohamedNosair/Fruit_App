import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/generated/l10n.dart';

import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20.w,
            child: Center(
              child: SvgPicture.asset(AppImages.search),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20.w,
            child: Center(
              child: SvgPicture.asset(
                AppImages.filter,
              ),
            ),
          ),
          hintStyle: TextStyles.font16RegularGray400,
          hintText: S.of(context).search,
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide:  BorderSide(
        width: 1.w,
        color: Colors.white,
      ),
    );
  }
}