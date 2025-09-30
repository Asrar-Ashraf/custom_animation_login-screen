import 'dart:math';

import 'package:flutter/material.dart';

class DiffrentShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Size(:width, :height) = size;
    Path path = Path();
    path.moveTo(width * 0.1, height * 0.4);
    path.lineTo(width * 0.25, height * 0.05);
    path.lineTo(width * 0.4, height * 0.4);
    path.lineTo(0, height * 0.2);
    path.lineTo(width * 0.5, height * 0.2);
    path.lineTo(width * 0.1, height * 0.4);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//Diamond shape

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Size(:width, :height) = size;
    Path path = Path();
    path.moveTo(width * 0.5, 0);
    path.lineTo(0, height * 0.5);
    path.lineTo(width * 0.5, height);
    path.lineTo(width, height * 0.5);
    path.lineTo(width * 0.5, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// triangle shape

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Size(:width, :height) = size;
    Path path = Path();
    path.moveTo(width * 0.5, 0);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width * 0.5, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class StokeCirclePainter extends CustomPainter {
  static const double strokeWidth = 18;
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    final center = Offset(width / 2, height / 2);
    final radius = min(width, height) / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    Paint paint = Paint();
    paint.shader = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.black,
        Colors.white,
        const Color.fromARGB(255, 212, 18, 4),
        Colors.orange,
        Colors.cyan,
        Colors.yellow,
        Colors.purpleAccent,
        Colors.orange,
        Colors.cyan,
        Colors.yellow,
        Colors.purpleAccent,
      ],
    ).createShader(rect);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      pi * 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(StokeCirclePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(StokeCirclePainter oldDelegate) => false;
}
