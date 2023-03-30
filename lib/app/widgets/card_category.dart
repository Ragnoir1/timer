// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:timer/extension/size_from_figma.dart';

class CardCategory extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Function() delet;
  final List<Color> color;
  CardCategory({
    Key? key,
    required this.label,
    required this.onTap,
    required this.delet,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 288.0.fromFigmaWidth(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: color,
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 40, color: Colors.white),
            ).paddingOnly(left: 15.0.fromFigmaWidth()),
            SizedBox(
              width: 30.0.fromFigmaWidth(),
            ),
            InkWell(
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onTap: delet
            )
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 40);
  }
}
