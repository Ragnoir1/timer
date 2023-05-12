// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';

import 'package:timer/extension/size_from_figma.dart';

class CardCategory extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Function() delete;
  final List<Color> colors;
  CardCategory({
    Key? key,
    required this.label,
    required this.onTap,
    required this.delete,
    required this.colors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 288.0.fromFigmaWidth(),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(1.5, 2), color: Colors.black.withOpacity(0.25))
          ],
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 35,
              width: Get.width * 0.75,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 40, color: AppColors.textColor),
                ).paddingOnly(left: 30),
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width * 0.25 - 40,
              child: InkWell(
                  child: Icon(
                    Icons.delete,
                    size: 35,
                    color: Colors.white,
                  ),
                  onTap: delete),
            )
          ],
        ),
      ),
    );
  }
}
