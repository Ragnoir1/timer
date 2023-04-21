// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:timer/app/data/colors.dart';

class StatisticAllTimePaint extends CustomPainter {
  String text;
  StatisticAllTimePaint({
    required this.text,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final roundPaint = Paint();
    roundPaint.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFed02d7),
        Color(0xFF01dfef),
      ],
    ).createShader(Rect.fromCircle(
      center: Offset((size.width / 2), (size.height / 2)),
      radius: (size.height / 2),
    ));
    roundPaint.style = PaintingStyle.stroke;
    roundPaint.strokeWidth = 4;

    canvas.drawCircle(Offset((size.width / 2), (size.height / 2)),
        (size.height / 2) - 2, roundPaint);

    final textStyle = TextStyle(
      color: AppColors.textColor,
      fontSize: 48,
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final x = (size.width - textPainter.width) / 2;
    final y = (size.height - textPainter.height) / 2;

    final offset = Offset(x, y);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
