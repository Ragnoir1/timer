// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';

class StatisticSingleTimePaint extends CustomPainter {
  String? text;
  int time;
  List<Color> colors;
  StatisticSingleTimePaint({
    required this.text,
    required this.time,
    required this.colors,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final roundPaint = Paint();
    roundPaint.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
    ).createShader(Rect.fromCircle(
      center: Offset((size.width / 2), (size.height / 2.5)),
      radius: (size.height / 4),
    ));
    roundPaint.style = PaintingStyle.stroke;
    roundPaint.strokeWidth = 4;

    canvas.drawCircle(Offset((size.width / 2), (size.height / 2)),
        (size.height / 2) - 2, roundPaint);

    final textStyle1 = TextStyle(
      color: AppColors.textColor,
      fontSize: 18,
    );

    final textStyle2 = TextStyle(
        color: AppColors.textColor,
        fontSize: 20,
        shadows: [Shadow(offset: Offset(0, 0), blurRadius: 16)]);

    final textSpan1 = TextSpan(
      text: text,
      style: textStyle1,
    );

    final textSpan2 = TextSpan(
      text: time < 3600
          ? "${time ~/ 60} ${'minute'.tr}"
          : "${time ~/ 3600} ${'hour'.tr}",
      style: textStyle2,
    );

    final textPainter1 = TextPainter(
      maxLines: 2,
      text: textSpan1,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    final textPainter2 = TextPainter(
      text: textSpan2,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter1.layout(
      minWidth: 0,
      maxWidth: size.width * 0.63,
    );

    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final x1 = (size.width - textPainter1.width) / 2;
    final y1 = (size.height - textPainter1.height) / 3.7;

    final x2 = (size.width - textPainter2.width) / 2;
    final y2 = (size.height - textPainter2.height) / 1.6;

    final offset1 = Offset(x1, y1);
    textPainter1.paint(canvas, offset1);

    final offset2 = Offset(x2, y2);
    textPainter2.paint(canvas, offset2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
