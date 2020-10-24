import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

/// Creates [SignalStrengthIndicator.bars] for sizing test.
Widget createBarSignalStrengthIndicatorSizingTest() {
  return Center(
    child: RepaintBoundary(
      child: Container(
        color: const Color(0xFF000000),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var i = 1; i < 11; i++)
                  SignalStrengthIndicator.bars(
                    value: 1.0,
                    size: i * 10.0,
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var i = 1; i < 11; i++)
                  SignalStrengthIndicator.bars(
                    value: 1.0,
                    barCount: 4,
                    size: i * 10.0,
                    radius: const Radius.circular(15.0),
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var i = 1; i < 11; i++)
                  SignalStrengthIndicator.bars(
                    value: 1.0,
                    barCount: 4,
                    size: i * 10.0,
                    spacing: 0.5,
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

/// Creates [SignalStrengthIndicator.bars] for value test.
Widget createBarSignalStrengthIndicatorValueTest() {
  return Center(
    child: RepaintBoundary(
      child: Container(
        color: const Color(0xFF000000),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SignalStrengthIndicator.bars(value: 0.0, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.1, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.2, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.3, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.4, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.5, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.6, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.7, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.8, size: 50.0),
            SignalStrengthIndicator.bars(value: 0.9, size: 50.0),
            SignalStrengthIndicator.bars(value: 1.0, size: 50.0),
          ],
        ),
      ),
    ),
  );
}

/// Creates [SignalStrengthIndicator.bars] for range test.
Widget createBarSignalStrengthIndicatorRangeTest() {
  return Center(
    child: RepaintBoundary(
      child: Container(
        color: const Color(0xFF000000),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            for (var val in [0, 30, 60, 90])
              SignalStrengthIndicator.bars(
                value: val,
                size: 50.0,
                minValue: 1,
                maxValue: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
          ],
        ),
      ),
    ),
  );
}

/// Creates [SignalStrengthIndicator.bars] for levels test.
Widget createBarSignalStrengthIndicatorLevelsTest() {
  return Center(
    child: RepaintBoundary(
      child: Container(
        color: const Color(0xFF000000),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                for (final val in [0.0, 0.26, 0.51, 0.76])
                  SignalStrengthIndicator.bars(
                    value: val,
                    size: 50.0,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    levels: <num, Color>{
                      0.25: Colors.red,
                      0.50: Colors.yellow,
                      0.75: Colors.green,
                    },
                  ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                for (final val in [0, 26, 51, 76])
                  SignalStrengthIndicator.bars(
                    value: val,
                    size: 50.0,
                    minValue: 0,
                    maxValue: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    radius: const Radius.circular(50.0),
                    inactiveColor: Colors.grey,
                    levels: <num, Color>{
                      25: Colors.red,
                      50: Colors.yellow,
                      75: Colors.green,
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

/// Creates [SignalStrengthIndicator.bars] for bevel test.
Widget createBarSignalStrengthIndicatorBevelTest() {
  return Center(
    child: RepaintBoundary(
      child: Container(
        color: const Color(0xFF000000),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                for (final val in [0.0, 0.3, 0.6, 0.9])
                  SignalStrengthIndicator.bars(
                    value: val,
                    size: 50.0,
                    bevelled: true,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                for (final val in [0.0, 0.3, 0.6, 0.9])
                  SignalStrengthIndicator.bars(
                    value: val,
                    size: 50.0,
                    bevelled: true,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    spacing: -0.02,
                  ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                for (final val in [0.0, 0.3, 0.6, 0.9])
                  SignalStrengthIndicator.bars(
                    value: val,
                    size: 50.0,
                    bevelled: true,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    spacing: 0.5,
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
