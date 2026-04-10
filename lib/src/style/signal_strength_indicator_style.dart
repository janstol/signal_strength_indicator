import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../util.dart';

/// Extend this class to create a custom signal strength indicator.
abstract class SignalStrengthIndicatorStyle {
  final num value;
  final num minValue;
  final num maxValue;
  final int barCount;
  final Map<num, Color> levels;
  final Color activeColor;
  final Color inactiveColor;
  final double? size;
  final EdgeInsets margin;

  const SignalStrengthIndicatorStyle({
    required this.value,
    num? minValue,
    num? maxValue,
    int? barCount,
    Map<num, Color>? levels,
    Color? activeColor,
    Color? inactiveColor,
    this.size,
    EdgeInsets? margin,
  })  : minValue = minValue ?? 0.0,
        maxValue = maxValue ?? 1.0,
        barCount = barCount ?? 3,
        levels = levels ?? const <num, Color>{},
        activeColor = activeColor ?? const Color(0xFF4CAF50),
        margin = margin ?? EdgeInsets.zero,
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

    // when there are no levels, use (create) 'default' levels
    if (levels.isEmpty) {
      for (var i = 0; i < barCount; i++) {
        levels[i / barCount] = activeColor;
      }
    }

    return levels;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignalStrengthIndicatorStyle) return false;
    return other.value == value &&
        other.minValue == minValue &&
        other.maxValue == maxValue &&
        other.barCount == barCount &&
        mapEquals(other.levels, levels) &&
        other.activeColor == activeColor &&
        other.inactiveColor == inactiveColor &&
        other.size == size &&
        other.margin == margin;
  }

  @override
  int get hashCode => Object.hash(
        value,
        minValue,
        maxValue,
        barCount,
        Object.hashAll(levels.entries.map((e) => Object.hash(e.key, e.value))),
        activeColor,
        inactiveColor,
        size,
        margin,
      );

  @override
  String toString() => 'SignalStrengthIndicatorStyle('
      '$value, $minValue, $maxValue, $size)';
}
