// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:timer/extension/size_from_figma.dart';

class SimpleButton extends StatelessWidget {
  String text;
  List<Color> colors;
  double? height;
  double? width;
  double? fontSize;
  double? borderRadius;
  Color textColor;
  Function() onTap;
  SimpleButton({
    Key? key,
    required this.text,
    required this.colors,
    this.height = 73.0,
    this.width = 206.0,
    this.fontSize = 40,
    this.borderRadius = 12,
    this.textColor = Colors.white,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width!.fromFigmaWidth(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: colors,
            stops: [0, 1],
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(borderRadius!),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
