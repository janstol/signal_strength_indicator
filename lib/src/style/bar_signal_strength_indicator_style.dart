import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/src/style/signal_strength_indicator_style.dart';
import 'package:signal_strength_indicator/src/util.dart';

class BarSignalStrengthIndicatorStyle extends SignalStrengthIndicatorStyle {
  final int barCount;
  final double spacing;
  final Radius radius;
  final Map<num, Color> levels;
  final bool bevelled;

  const BarSignalStrengthIndicatorStyle({
    this.barCount = 3,
    this.spacing,
    this.levels,
    this.bevelled,
    Radius radius,
    num value,
    num minValue,
    num maxValue,
    Color activeColor,
    Color inactiveColor,
    double size,
    EdgeInsets margin,
  })  : radius = radius ?? Radius.zero,
        super(
          value: value,
          minValue: minValue,
          maxValue: maxValue,
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

    final value = normalizeValue(style.value, style.minValue, style.maxValue);

    final Map<num, Color> thresholds = style.levels ?? {};
    // remove thresholds where value is out of range
    thresholds
        .removeWhere((key, _) => key < style.minValue || key > style.maxValue);

    // when there are no threshold or number of thresholds does not correspond
    // with number of bars, use (create) 'default' thresholds
    if (thresholds.isEmpty || thresholds.keys.length != barCount) {
      thresholds.clear();
      for (var i = 0; i < barCount; i++) {
        thresholds.addAll({i / barCount: style.activeColor});
      }
    }

    final keys = thresholds.keys.toList()..sort();
    final key = keys.lastWhere((t) => t < value, orElse: () => keys.first);
    final Paint activeBarPaint = Paint()..color = thresholds[key];
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
