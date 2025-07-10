import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/themes/styles.dart';
import 'package:fruit_app/core/utils/spacing_helper.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.Image,
    required this.backGround,
    required this.title,
    required this.subTitle, required this.visibility,
  });
  final String Image, backGround, subTitle;
  final Widget title;
  final bool visibility ;

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backGround, fit: BoxFit.fill),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(Image),
              ),

              Visibility(
                visible: visibility,
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(tr.skip, style: TextStyles.font13regularGray400),
                  ),
                ),
              ),
            ],
          ),
        ),
        heightSpace(64),
        title,
        heightSpace(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.font13semiBoldGray500,
          ),
        ),
      ],
    );
  }
}
