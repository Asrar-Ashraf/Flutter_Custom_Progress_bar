import 'dart:math';

import 'package:flutter/material.dart';

class Customdesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();
    const int cl = 255;
    final Size(:width, :height) = size;
    final rotate = pi * 2 / 45;
    final Center = Offset(width / 2, height / 2);
    final radius = min(width, height) / 2;
    Paint paint = Paint();
    paint.color = Color.fromARGB(
      random.nextInt(cl),
      random.nextInt(cl),
      random.nextInt(cl),
      random.nextInt(cl),
    );
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.square;
    paint.strokeWidth = 10;
    canvas.save();
    canvas.translate(width / 2, height / 2);
    for (var i = 0; i < 50; i++) {
      if (i % 5 == 0) {
        canvas.drawCircle(Offset(0, -radius), 15, paint);
      }
      canvas.rotate(rotate);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(Customdesign oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Customdesign oldDelegate) => false;
}
