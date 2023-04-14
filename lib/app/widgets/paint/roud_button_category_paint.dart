// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundButtonCategoryPaint extends CustomPainter {
  String text1;
  String text2;
  Color color;
  RoundButtonCategoryPaint({
    required this.text1,
    required this.text2,
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final arcPaint = Paint();
    arcPaint.strokeWidth = 4;
    arcPaint.style = PaintingStyle.stroke;
    arcPaint.color = color;
    canvas.drawArc(Offset(2, 2) & Size(size.width - 4, size.height - 4), 5.8,
        5.66, false, arcPaint);

    final roundPaint = Paint();
    roundPaint.style = PaintingStyle.stroke;
    roundPaint.strokeWidth = 3;
    roundPaint.color = color;
    canvas.drawCircle(Offset(size.width - 25, 25), 22, roundPaint);

    final linePaint = Paint();
    linePaint.strokeWidth = 3;
    linePaint.color = color;
    canvas.drawLine(Offset(18, size.height / 2),
        Offset(size.width - 18, size.height / 2), linePaint);

    final path = Path();
    final curve = Paint();
    curve.style = PaintingStyle.stroke;
    curve.strokeWidth = 3;
    curve.color = color;
    path.moveTo(size.width * 0.76, size.height * 0.1);
    path.lineTo(size.width * 0.77, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.1);
    path.lineTo(size.width * 0.83, size.height * 0.2);
    path.lineTo(size.width * 0.905, size.height * 0.15);
    path.lineTo(size.width * 0.885, size.height * 0.24);
    canvas.drawPath(path, curve);

    final textStyle1 = TextStyle(
      color: Colors.white,
      fontSize: 28,
    );

    final textStyle2 = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );

    final textSpan1 = TextSpan(
      text: text1,
      style: textStyle1,
    );

    final textSpan2 = TextSpan(
      text: text2,
      style: textStyle2,
    );

    final textPainter1 = TextPainter(
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
      maxWidth: size.width,
    );

    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final x1 = (size.width - textPainter1.width) / 2;
    final y1 = (size.height - textPainter1.height) / 3;

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
