import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MRec extends CustomPainter {
  double startFromX, endToX;

  @override
  void paint(Canvas canvas, Size size) {
    startFromX = size.width / 2 - 100;
    endToX = startFromX + 200;

    drawCenterRect(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDeledate) => true;

  void drawCenterRect(Canvas canvas) {
    Shader linearGrient = LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Colors.grey,
          Colors.orange[200]
        ]).createShader(
        Rect.fromCenter(center: Offset(endToX, 400), height: 500, width: 1));

    Path path = Path();
    path.moveTo(startFromX, 250);
    path.lineTo(startFromX, 400);
    path.lineTo(endToX, 400);
    path.lineTo(endToX, 250);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange[200]
          ..shader = linearGrient);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }
}
