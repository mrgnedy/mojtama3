import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double _x;
  double _y;
  double _per;

  CircleProgress(this._x, this._y, this._per);

  double get per => _per;

  double get x => _x;

  double get y => _y;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint outerCircle = Paint()
      ..strokeWidth = 6
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(x * 1.0, y * 1.0);

    canvas.drawCircle(center, radius, outerCircle);
    double angle = 2 * pi * (per / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc); // this draws main outer circle
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
