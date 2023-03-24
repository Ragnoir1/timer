import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButtonCategory extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final arcPaint = Paint();
    arcPaint.strokeWidth = 4;
    arcPaint.style = PaintingStyle.stroke;
    arcPaint.color = Color.fromARGB(255, 0, 225, 239);
    canvas.drawArc(Offset(2, 2) & Size(size.width - 4, size.height - 4), 5.8,
        5.66, false, arcPaint);

    final roundPaint = Paint();
    roundPaint.style = PaintingStyle.stroke;
    roundPaint.strokeWidth = 3;
    roundPaint.color = Color.fromARGB(255, 0, 225, 239);
    canvas.drawCircle(Offset(size.width - 25, 25), 22, roundPaint);

    final linePaint = Paint();
    linePaint.strokeWidth = 3;
    linePaint.color = Color.fromARGB(255, 0, 225, 239);
    canvas.drawLine(Offset(18, size.height / 2),
        Offset(size.width - 18, size.height / 2), linePaint);

    final path = Path();
    final curve = Paint();
    curve.style = PaintingStyle.stroke;
    curve.strokeWidth = 3;
    curve.color = Color.fromARGB(255, 0, 225, 239);
    path.moveTo(size.width * 0.76, size.height * 0.1);
    path.lineTo(size.width * 0.77, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.1);
    path.lineTo(size.width * 0.83, size.height * 0.2);
    path.lineTo(size.width * 0.905, size.height * 0.15);
    path.lineTo(size.width * 0.885, size.height * 0.24);

    canvas.drawPath(path, curve);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
