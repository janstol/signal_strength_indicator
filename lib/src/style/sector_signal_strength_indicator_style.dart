import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/src/style/signal_strength_indicator_style.dart';

class SectorSignalStrengthIndicatorStyle extends SignalStrengthIndicatorStyle {
  final double spacing;
  final bool rounded;

  const SectorSignalStrengthIndicatorStyle({
    required this.spacing,
    required this.rounded,
    required super.value,
    super.minValue,
    super.maxValue,
    super.barCount,
    super.levels,
    super.activeColor,
    super.inactiveColor,
    required super.size,
    super.margin,
  });

  @override
  CustomPainter get painter => _SectorSignalStrengthIndicatorPainter(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SectorSignalStrengthIndicatorStyle) return false;
    return super == other &&
        other.spacing == spacing &&
        other.rounded == rounded;
  }

  @override
  int get hashCode => Object.hash(super.hashCode, spacing, rounded);
}

class _SectorSignalStrengthIndicatorPainter extends CustomPainter {
  final SectorSignalStrengthIndicatorStyle style;

  const _SectorSignalStrengthIndicatorPainter(this.style);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final barCount = style.barCount;
    final strokeWidth = h / barCount;
    final spacing = style.spacing * strokeWidth;

    final value = style.normalizedValue;
    final Map<num, Color> levels = style.normalizedLevels;
    final keys = levels.keys.toList()..sort();
    final key =
        keys.lastWhere((num t) => t <= value, orElse: () => keys.first);

    final Paint activeBarPaint = Paint()
      ..color = levels[key]!
      ..strokeWidth = strokeWidth - spacing
      ..strokeCap = style.rounded ? StrokeCap.round : StrokeCap.butt
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final Paint inactiveBarPaint = Paint()
      ..color = style.inactiveColor
      ..strokeWidth = strokeWidth - spacing
      ..strokeCap = style.rounded ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke;

    final Paint activeFirstPaint = Paint()
      ..color = levels[key]!
      ..strokeWidth = strokeWidth - spacing
      ..style = PaintingStyle.fill;

    final Paint inactiveFirstPaint = Paint()
      ..color = style.inactiveColor
      ..strokeWidth = strokeWidth - spacing
      ..style = PaintingStyle.fill;

    canvas.clipRect(Rect.fromLTWH(0, 0, w, h));

    // draw segments
    for (int i = 1; i <= barCount; i++) {
      final arcOffset = (barCount - i) * strokeWidth;
      final radius = w - arcOffset - (strokeWidth / 2);
      final barThreshold = (i - 1) / barCount;

      final paint = value >= barThreshold ? activeBarPaint : inactiveBarPaint;
      final firstPaint =
          value >= barThreshold ? activeFirstPaint : inactiveFirstPaint;

      if (i == 1) {
        // draw first segment
        if (style.rounded) {
          final r = strokeWidth / pi * 1.3;
          canvas.drawCircle(size.bottomLeft(Offset(r, -r)), r, firstPaint);
        } else {
          canvas.drawArc(
            Rect.fromCircle(
              center: size.bottomLeft(Offset.zero),
              radius: strokeWidth - (spacing / 2),
            ),
            -90 * (pi / 180),
            90 * (pi / 180),
            true,
            firstPaint,
          );
        }
      } else {
        // draw other segments
        final roundedOffset = style.rounded ? strokeWidth / 2.0 : 0.0;
        canvas.drawArc(
          Rect.fromCircle(
            center: size.bottomLeft(Offset(roundedOffset, -roundedOffset)),
            radius: radius - roundedOffset,
          ),
          -90 * (pi / 180),
          90 * (pi / 180),
          false,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_SectorSignalStrengthIndicatorPainter oldDelegate) {
    return oldDelegate.style != style;
  }
}
