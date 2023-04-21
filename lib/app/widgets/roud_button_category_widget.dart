// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';

import 'package:timer/app/widgets/paint/roud_button_category_paint.dart';

class RoundButtonCategoryWidget extends StatelessWidget {
  String image;
  String mainText;
  String secondaryText;
  Function()? onTap;
  RoundButtonCategoryWidget({
    Key? key,
    required this.image,
    required this.mainText,
    required this.secondaryText,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Image.asset(image),
            Align(
              child: Text(
                mainText,
                style: TextStyle(color: AppColors.textColor, fontSize: 24),
              ),
            ).paddingOnly(bottom: 43),
            Align(
              child: Text(
                secondaryText,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textColor, fontSize: 14),
              ),
            ).paddingOnly(top: 57)
          ],
        ),
      ),
    );
  }
}
