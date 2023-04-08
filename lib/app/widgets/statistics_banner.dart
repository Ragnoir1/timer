// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:timer/extension/size_from_figma.dart';

class StatisticsBanner extends StatelessWidget {
  String text;
  String time;
  List<Color> colors;
  StatisticsBanner({
    Key? key,
    required this.text,
    required this.time,
    required this.colors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 363.0.fromFigmaWidth(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colors),
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 36, color: Colors.white, shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-0.9, -0.9),
                  color: Colors.black),
              Shadow(
                  // bottomRight
                  offset: Offset(0.9, -0.9),
                  color: Colors.black),
              Shadow(
                  // topRight
                  offset: Offset(0.9, 0.9),
                  color: Colors.black),
              Shadow(
                  // topLeft
                  offset: Offset(-0.9, 0.9),
                  color: Colors.black),
            ]),
          ).paddingSymmetric(horizontal: 16),
          Container(
            height: 66,
            width: 110,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Center(
              child: Text(
                time,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
