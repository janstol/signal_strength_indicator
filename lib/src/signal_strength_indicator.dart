import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/src/style/bar_signal_strength_indicator_style.dart';
import 'package:signal_strength_indicator/src/style/sector_signal_strength_indicator_style.dart';
import 'package:signal_strength_indicator/src/style/signal_strength_indicator_style.dart';

class SignalStrengthIndicator extends StatelessWidget {
  final SignalStrengthIndicatorStyle style;

  const SignalStrengthIndicator({
    super.key,
    required this.style,
  });

  /// Creates signal strength indicator with bars.
  ///
  /// You have to provide [value] which should be in range
  /// from [minValue] to [maxValue] (default 0.0 to 1.0).
  ///
  /// Number of bars can be specified by [barCount]
  /// (reasonable number of bars is 3,4 or maybe 5).
  ///
  /// Indicator can be [bevelled] or have [radius] but not both.
  ///
  /// To specify how the indicator should behave, use [levels]. Levels values
  /// are absolute values from [minValue] - [maxValue] and number of levels is
  /// the same as [barCount]
  /// For example:
  /// ```dart
  /// SignalStrengthIndicator.bars(
  ///   value: val,
  ///   minValue: 0,
  ///   maxValue: 100,
  ///   levels: <num, Color>{
  ///     25: Colors.red,
  ///     50: Colors.yellow,
  ///     75: Colors.green,
  ///   },
  /// )
  /// ```
  /// means that first bar will be red when value is >= 25,
  /// first and second bar will be yellow when value is >= 50,
  /// and all bars will be green when value is >= 75.
  SignalStrengthIndicator.bars({
    Key? key,
    required num value,
    double? size,
    int barCount = 3,
    num? minValue,
    num? maxValue,
    Color? activeColor,
    Color? inactiveColor,
    Map<num, Color>? levels,
    Radius? radius,
    bool bevelled = false,
    double spacing = 0.2,
    EdgeInsets margin = EdgeInsets.zero,
  }) : this(
          key: key,
          style: BarSignalStrengthIndicatorStyle(
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            barCount: barCount,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            levels: levels,
            size: size,
            radius: radius,
            bevelled: bevelled,
            spacing: spacing,
            margin: margin,
          ),
        );

  /// Creates signal strength indicator with sectors.
  ///
  /// You have to provide [value] which should be in range
  /// from [minValue] to [maxValue] (default 0.0 to 1.0).
  ///
  /// Number of bars (segments) can be specified by [barCount]
  /// (reasonable number of bars is 3,4 or maybe 5).
  ///
  /// To specify how the indicator should behave, use [levels] -
  /// see [SignalStrengthIndicator.bars]
  SignalStrengthIndicator.sector({
    Key? key,
    required num value,
    required double size,
    int barCount = 3,
    num? minValue,
    num? maxValue,
    Color? activeColor,
    Color? inactiveColor,
    Map<num, Color>? levels,
    bool rounded = false,
    double spacing = 0.3,
    EdgeInsets margin = EdgeInsets.zero,
  }) : this(
          key: key,
          style: SectorSignalStrengthIndicatorStyle(
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            barCount: barCount,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            levels: levels,
            size: size,
            rounded: rounded,
            spacing: spacing,
            margin: margin,
          ),
        );

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double size = style.size ?? iconTheme.size ?? 24.0;

    return Container(
      margin: style.margin,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: style.painter,
        ),
      ),
    );
  }
}
