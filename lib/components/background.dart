import 'package:flutter/material.dart';

class SprayPainter extends CustomPainter {
  const SprayPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.2, -0.5),
        radius: 1.2,
        colors: [
          const Color(0xFFC2FA2F), // green-yellow
          const Color(0xFFB1F1B4), // madang (cool minty)
          Colors.transparent
        ],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}