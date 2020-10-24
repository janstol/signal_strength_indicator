import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signal_strength_indicator/src/style/bar_signal_strength_indicator_style.dart';

import '../util.dart';

/// Extend this class to create a custom signal strength indicator.
///
/// See [BarSignalStrengthIndicatorStyle].
abstract class SignalStrengthIndicatorStyle {
  final num value;
  final num minValue;
  final num maxValue;
  final int barCount;
  final Map<num, Color> levels;
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final EdgeInsets margin;

  const SignalStrengthIndicatorStyle({
    @required this.value,
    num minValue,
    num maxValue,
    int barCount,
    Map<num, Color> levels,
    Color activeColor,
    Color inactiveColor,
    this.size,
    this.margin = EdgeInsets.zero,
  })  : minValue = minValue ?? 0.0,
        maxValue = maxValue ?? 1.0,
        barCount = barCount ?? 3,
        levels = levels ?? const <num, Color>{},
        activeColor = activeColor ?? const Color(0xFF4CAF50),
        inactiveColor = inactiveColor ?? const Color(0xFFC8E6C9);

  /// Painter is responsible for painting indicator.
  CustomPainter get painter;

  /// Returns normalized value of [value] (range from 0.0 to 1.0).
  num get normalizedValue => normalizeValue(value, minValue, maxValue);

  /// Returns [levels] with normalized values (range from 0.0 to 1.0).
  Map<num, Color> get normalizedLevels {
    var levels = Map.of(this.levels);
    // remove levels where value is out of range
    levels.removeWhere((key, _) => key < minValue || key > maxValue);
    // normalize values
    levels = levels
        .map((k, v) => MapEntry(normalizeValue(k, minValue, maxValue), v));

    // when there are no levels or number of levels does not correspond
    // with number of bars, use (create) 'default' levels
    if (levels.isEmpty || levels.keys.length != barCount) {
      levels.clear();
      for (var i = 0; i < barCount; i++) {
        levels.addAll({i / barCount: activeColor});
      }
    }

    return levels;
  }

  @override
  String toString() => 'SignalStrengthIndicatorStyle('
      '$value, $minValue, $maxValue, $size)';
}
