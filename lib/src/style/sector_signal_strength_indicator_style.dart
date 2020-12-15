import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/src/style/signal_strength_indicator_style.dart';

class SectorSignalStrengthIndicatorStyle extends SignalStrengthIndicatorStyle {
  final double spacing;
  final bool rounded;

  const SectorSignalStrengthIndicatorStyle({
    required this.spacing,
    required this.rounded,
    required num value,
    num? minValue,
    num? maxValue,
    int? barCount,
    Map<num, Color>? levels,
    Color? activeColor,
    Color? inactiveColor,
    required double size,
    EdgeInsets? margin,
  }) : super(
          value: value,
          minValue: minValue,
          maxValue: maxValue,
          barCount: barCount,
          levels: levels,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          size: size,
          margin: margin,
        );

  @override
  CustomPainter get painter => _SectorSignalStrengthIndicatorPainter(this);
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
    final key = keys.lastWhere((num t) => t < value, orElse: () => keys.first);

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

    // draw segments
    for (int i = 1; i <= barCount; i++) {
      final offset = (barCount - i) * strokeWidth;
      final radius = w - offset - (strokeWidth / 2);

      final paint = value > keys[i - 1] ? activeBarPaint : inactiveBarPaint;
      final firstPaint =
          value > keys[i - 1] ? activeFirstPaint : inactiveFirstPaint;

      canvas.clipRect(Rect.fromLTWH(0, 0, w, h));

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
        final offset = style.rounded ? strokeWidth / 2.0 : 0.0;
        canvas.drawArc(
          Rect.fromCircle(
            center: size.bottomLeft(Offset(offset, -offset)),
            radius: radius - offset,
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
    return false;
  }
}
