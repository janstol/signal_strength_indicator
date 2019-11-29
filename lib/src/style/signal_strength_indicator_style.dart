import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signal_strength_indicator/src/style/bar_signal_strength_indicator_style.dart';

/// Extend this class to create a custom signal strength indicator.
///
/// See [BarSignalStrengthIndicatorStyle].
abstract class SignalStrengthIndicatorStyle {
  final num value;
  final num minValue;
  final num maxValue;
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final EdgeInsets margin;

  const SignalStrengthIndicatorStyle({
    @required this.value,
    num minValue,
    num maxValue,
    Color activeColor,
    Color inactiveColor,
    this.size,
    this.margin = EdgeInsets.zero,
  })  : minValue = minValue ?? 0.0,
        maxValue = maxValue ?? 1.0,
        activeColor = activeColor ?? const Color(0xFF4CAF50),
        inactiveColor = inactiveColor ?? const Color(0xFFC8E6C9);

  /// Painter is responsible for painting indicator.
  CustomPainter get painter;

  @override
  String toString() => "SignalStrengthIndicatorStyle("
      "$value, $minValue, $maxValue, $size)";
}
