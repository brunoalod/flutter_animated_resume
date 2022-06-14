import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPositionedRing extends StatelessWidget {
  final List<AnimatedPositionedRingData> steps;
  final int step;

  const AnimatedPositionedRing({
    Key? key,
    required this.step,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimatedPositionedRingData data = steps[step];
    final double screenWidth = MediaQuery.of(context).size.longestSide;

    return AnimatedPositioned(
      top: data.top,
      right: data.right,
      left: data.left,
      bottom: data.bottom,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(milliseconds: 2500),
      child: AnimatedScale(
        scale: data.scale,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 2500),
        child: CustomPaint(
          size: MediaQuery.of(context).size,
          painter: RingPainter(
            color: Theme.of(context).primaryColor,
            strokeWidth: 0.125 * screenWidth,
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedRingData {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final double scale;

  AnimatedPositionedRingData({
    this.top,
    this.bottom,
    this.right,
    this.left,
    required this.scale,
  });
}

class RingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  RingPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(width / 2, height / 2);

    double radius = min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
