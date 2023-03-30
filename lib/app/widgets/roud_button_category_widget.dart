// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:timer/app/widgets/roud_button_category_paint.dart';

class RoundButtonCategoryWidget extends StatelessWidget {
  //TODO: Передавать фиксированный размер через Get.width - отступы делить на кол-во виджетов в строке
  String mainText;
  String secondaryText;
  Color color;
  Function()? onTap;
  RoundButtonCategoryWidget({
    Key? key,
    required this.mainText,
    required this.secondaryText,
    required this.color,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: InkWell(
        child: CustomPaint(
          painter: RoundButtonCategoryPaint(
              text1: mainText, text2: secondaryText, color: color),
        ),
        onTap: onTap,
      ),
    );
  }
}
