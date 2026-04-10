import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:signal_strength_indicator/src/style/bar_signal_strength_indicator_style.dart';

void main() {
  group('normalizedLevels', () {
    BarSignalStrengthIndicatorStyle style({
      Map<num, Color>? levels,
      int barCount = 3,
    }) =>
        BarSignalStrengthIndicatorStyle(
          value: 0.5,
          barCount: barCount,
          levels: levels,
          spacing: 0.2,
          bevelled: false,
        );

    test('generates default levels when none provided', () {
      final normalized = style().normalizedLevels;
      expect(normalized.length, 3);
      expect(normalized.values.every((c) => c == const Color(0xFF4CAF50)),
          isTrue);
    });

    test('normalizes user-provided levels', () {
      final normalized = BarSignalStrengthIndicatorStyle(
        value: 50,
        minValue: 0,
        maxValue: 100,
        levels: {25: Colors.red, 50: Colors.yellow, 75: Colors.green},
        spacing: 0.2,
        bevelled: false,
      ).normalizedLevels;
      expect(normalized.containsKey(0.25), isTrue);
      expect(normalized.containsKey(0.5), isTrue);
      expect(normalized.containsKey(0.75), isTrue);
    });

    test('accepts user levels with count not matching barCount', () {
      // 2 levels for a 4-bar indicator — should not be discarded
      final normalized = BarSignalStrengthIndicatorStyle(
        value: 50,
        minValue: 0,
        maxValue: 100,
        barCount: 4,
        levels: {25: Colors.red, 75: Colors.green},
        spacing: 0.2,
        bevelled: false,
      ).normalizedLevels;
      expect(normalized.length, 2);
    });

    test('removes out-of-range level keys', () {
      final s = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        minValue: 0,
        maxValue: 100,
        levels: {-10: Colors.red, 50: Colors.yellow, 200: Colors.green},
        spacing: 0.2,
        bevelled: false,
      );
      final normalized = s.normalizedLevels;
      // only the in-range key (50) should survive
      expect(normalized.length, 1);
      expect(normalized.containsKey(0.5), isTrue);
    });

    test('falls back to defaults when all levels are out of range', () {
      final s = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        minValue: 0,
        maxValue: 100,
        levels: {-10: Colors.red, 200: Colors.green},
        spacing: 0.2,
        bevelled: false,
      );
      final normalized = s.normalizedLevels;
      expect(normalized.length, 3); // default barCount
    });
  });

  group('BarSignalStrengthIndicatorStyle equality', () {
    test('equal styles compare as equal', () {
      final a = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        spacing: 0.2,
        bevelled: false,
      );
      final b = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        spacing: 0.2,
        bevelled: false,
      );
      expect(a, equals(b));
    });

    test('different value compares as not equal', () {
      final a = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        spacing: 0.2,
        bevelled: false,
      );
      final b = BarSignalStrengthIndicatorStyle(
        value: 0.8,
        spacing: 0.2,
        bevelled: false,
      );
      expect(a, isNot(equals(b)));
    });

    test('different color compares as not equal', () {
      final a = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        spacing: 0.2,
        bevelled: false,
        activeColor: Colors.green,
      );
      final b = BarSignalStrengthIndicatorStyle(
        value: 0.5,
        spacing: 0.2,
        bevelled: false,
        activeColor: Colors.red,
      );
      expect(a, isNot(equals(b)));
    });
  });
}
