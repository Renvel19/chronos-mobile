import 'package:flutter/material.dart';
import 'dart:math';

class ClockPainter extends CustomPainter {
  final TimeOfDay time;

  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paintCircle = Paint()
      ..color = Colors.purple[50]!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paintCircle);

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    
    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30) * (pi / 180) - pi / 2;
      final offset = Offset(
        center.dx + (radius * 0.75) * cos(angle),
        center.dy + (radius * 0.75) * sin(angle),
      );
      
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(color: Colors.black, fontSize: 16),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset - Offset(textPainter.width / 2, textPainter.height / 2));
    }

    final paintHand = Paint()
      ..color = Colors.purple[400]!
      ..strokeWidth = 4;

    double hourAngle = ((time.hour % 12) + (time.minute / 60)) * (2 * pi / 12) - pi / 2;
    final handLength = radius * 0.6;
    final handEnd = Offset(
      center.dx + handLength * cos(hourAngle),
      center.dy + handLength * sin(hourAngle),
    );

    canvas.drawLine(center, handEnd, paintHand);

    final paintHourCircle = Paint()
      ..color = Colors.purple[400]!
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(handEnd, radius * 0.15, paintHourCircle);

    final paintDot = Paint()
      ..color = Colors.purple[400]!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 6, paintDot);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
