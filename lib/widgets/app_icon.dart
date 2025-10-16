import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const AppIcon({
    super.key,
    this.size = 512,
    this.backgroundColor = Colors.black,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size * 0.15), // 15% border radius
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Dumbbell icon
          CustomPaint(
            size: Size(size * 0.6, size * 0.4),
            painter: DumbbellPainter(
              color: iconColor,
              strokeWidth: size * 0.02,
            ),
          ),
          // "F" letter
          Positioned(
            bottom: size * 0.15,
            child: Text(
              'F',
              style: TextStyle(
                color: iconColor,
                fontSize: size * 0.25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DumbbellPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DumbbellPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final centerY = size.height / 2;
    final weightWidth = size.width * 0.15;
    final weightHeight = size.height * 0.6;
    final barWidth = size.width * 0.7;
    final barHeight = size.height * 0.15;

    // Left weight
    final leftWeightRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, centerY - weightHeight / 2, weightWidth, weightHeight),
      Radius.circular(weightWidth / 2),
    );
    canvas.drawRRect(leftWeightRect, fillPaint);

    // Right weight
    final rightWeightRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width - weightWidth,
        centerY - weightHeight / 2,
        weightWidth,
        weightHeight,
      ),
      Radius.circular(weightWidth / 2),
    );
    canvas.drawRRect(rightWeightRect, fillPaint);

    // Center bar
    final barRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(weightWidth, centerY - barHeight / 2, barWidth, barHeight),
      Radius.circular(barHeight / 2),
    );
    canvas.drawRRect(barRect, fillPaint);

    // Grip lines
    final gripSpacing = barWidth / 12;
    for (int i = 1; i <= 11; i++) {
      final x = weightWidth + (gripSpacing * i);
      canvas.drawLine(
        Offset(x, centerY - barHeight / 2),
        Offset(x, centerY + barHeight / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
