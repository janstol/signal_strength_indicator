import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/src/style/signal_strength_indicator_style.dart';

class BarSignalStrengthIndicatorStyle extends SignalStrengthIndicatorStyle {
  final double spacing;
  final Radius radius;
  final bool bevelled;

  const BarSignalStrengthIndicatorStyle({
    required this.spacing,
    required this.bevelled,
    Radius? radius,
    required num value,
    num? minValue,
    num? maxValue,
    int? barCount,
    Map<num, Color>? levels,
    Color? activeColor,
    Color? inactiveColor,
    double? size,
    EdgeInsets? margin,
  })  : radius = radius ?? Radius.zero,
        super(
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
  CustomPainter get painter => _BarSignalStrengthIndicatorPainter(this);
}

class _BarSignalStrengthIndicatorPainter extends CustomPainter {
  final BarSignalStrengthIndicatorStyle style;

  const _BarSignalStrengthIndicatorPainter(this.style);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final barCount = style.barCount;
    final barWidth = w / barCount;
    final spacing = style.spacing * barWidth;
    final barWidthTotal = barWidth - spacing * ((barCount - 1) / barCount);

    final value = style.normalizedValue;
    final Map<num, Color> levels = style.normalizedLevels;
    final keys = levels.keys.toList()..sort();
    final key = keys.lastWhere((num t) => t < value, orElse: () => keys.first);
    final Paint activeBarPaint = Paint()..color = levels[key]!;
    final Paint inactiveBarPaint = Paint()..color = style.inactiveColor;

    // draw bars
    for (var i = 1; i <= barCount; i++) {
      final barHeight = h * (i / barCount);
      final left = (i - 1) * (barWidthTotal + spacing);
      final top = h - barHeight;

      final paint = value > keys[i - 1] ? activeBarPaint : inactiveBarPaint;

      Path bar;

      if (style.bevelled) {
        final prevBarHeight = (i == 1) ? 0 : (h * ((i - 1) / barCount));
        bar = Path()
          ..moveTo(left, top + barHeight - prevBarHeight)
          ..lineTo(left + barWidthTotal, top + (spacing * 0.75))
          ..lineTo(left + barWidthTotal, top + barHeight)
          ..lineTo(left, top + barHeight)
          ..close();
      } else {
        final rrect = RRect.fromRectAndRadius(
          Rect.fromLTWH(left, top, barWidthTotal, barHeight),
          style.radius,
        );
        bar = Path()..addRRect(rrect);
      }

      canvas.drawPath(bar, paint);
    }
  }

  @override
  bool shouldRepaint(_BarSignalStrengthIndicatorPainter oldDelegate) {
    return false;
  }
}
