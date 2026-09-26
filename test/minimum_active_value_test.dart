import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

void main() {
  const activeColor = Color(0xFFF44336);
  const inactiveColor = Color(0xFF2196F3);

  Future<Color> firstSegmentColor(WidgetTester tester, Widget indicator) async {
    final boundaryKey = GlobalKey();
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: RepaintBoundary(key: boundaryKey, child: indicator),
        ),
      ),
    );

    return (await tester.runAsync(() async {
      final boundary = boundaryKey.currentContext!.findRenderObject()!
          as RenderRepaintBoundary;
      final image = await boundary.toImage();
      final bytes =
          (await image.toByteData(format: ui.ImageByteFormat.rawRgba))!;
      final offset = (75 * image.width + 10) * 4;
      final color = Color.fromARGB(
        bytes.getUint8(offset + 3),
        bytes.getUint8(offset),
        bytes.getUint8(offset + 1),
        bytes.getUint8(offset + 2),
      );
      image.dispose();
      return color;
    }))!;
  }

  for (final variant in ['bars', 'sector']) {
    Widget indicator(num value,
        {num? minimumActiveValue, num? minValue, num? maxValue}) {
      if (variant == 'bars') {
        return SignalStrengthIndicator.bars(
          value: value,
          size: 90,
          minValue: minValue,
          maxValue: maxValue,
          minimumActiveValue: minimumActiveValue,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        );
      }
      return SignalStrengthIndicator.sector(
        value: value,
        size: 90,
        minValue: minValue,
        maxValue: maxValue,
        minimumActiveValue: minimumActiveValue,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
      );
    }

    testWidgets('$variant preserves the active first segment by default',
        (tester) async {
      expect(await firstSegmentColor(tester, indicator(0)), activeColor);
    });

    testWidgets('$variant activates at a decimal minimumActiveValue',
        (tester) async {
      expect(
        await firstSegmentColor(
            tester, indicator(0.09, minimumActiveValue: 0.1)),
        inactiveColor,
      );
      expect(
        await firstSegmentColor(
            tester, indicator(0.1, minimumActiveValue: 0.1)),
        activeColor,
      );
    });

    testWidgets('$variant uses an absolute threshold in a custom range',
        (tester) async {
      expect(
        await firstSegmentColor(
          tester,
          indicator(-95.6,
              minValue: -100, maxValue: -40, minimumActiveValue: -95.5),
        ),
        inactiveColor,
      );
      expect(
        await firstSegmentColor(
          tester,
          indicator(-95.5,
              minValue: -100, maxValue: -40, minimumActiveValue: -95.5),
        ),
        activeColor,
      );
    });

    test('$variant rejects thresholds outside the first segment interval', () {
      expect(() => indicator(0, minimumActiveValue: -0.1), throwsAssertionError);
      expect(() => indicator(0, minimumActiveValue: 0.5), throwsAssertionError);
    });
  }
}
