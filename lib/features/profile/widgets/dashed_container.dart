import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final Color color;
  final Color? bgColor;
  final double dashLength;
  final double gapLength;
  final double radius;
  final EdgeInsets padding;
  final EdgeInsets margin;

  final double width;
  final double height;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.strokeWidth = 1,
    this.color = Colors.grey,
    this.dashLength = 6,
    this.gapLength = 4,
    this.radius = 12,
    this.padding = const EdgeInsets.all(12),
    this.margin = EdgeInsets.zero,
    required this.width,
    required this.height,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: color,
          strokeWidth: strokeWidth,
          dashLength: dashLength,
          gapLength: gapLength,
          radius: radius,
        ),
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double gapLength;
  final double radius;

  _DashedBorderPainter({
    required this.strokeWidth,
    required this.color,
    required this.dashLength,
    required this.gapLength,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect outer = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final Path path = Path()..addRRect(outer);
    final PathMetrics pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final nextDashLength = dashLength;
        final extractedPath = metric.extractPath(
          distance,
          distance + nextDashLength,
        );
        canvas.drawPath(extractedPath, paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
