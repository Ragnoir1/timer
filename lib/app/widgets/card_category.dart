// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/extension/size_from_figma.dart';

class CardCategory extends StatelessWidget {
  final String label;
  final Function() onTap;
  CardCategory({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 288.0.fromFigmaWidth(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 40),
            ).paddingOnly(left: 15.0.fromFigmaWidth()),
            SizedBox(
              width: 30.0.fromFigmaWidth(),
            ),
            InkWell(
              child: Icon(Icons.delete),
            )
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 40);
  }
}
