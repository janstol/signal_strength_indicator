import 'package:flutter_test/flutter_test.dart';
import 'package:signal_strength_indicator/src/util.dart';

void main() {
  group('normalizeValue', () {
    test('normalizes value within range', () {
      expect(normalizeValue(0.5, 0.0, 1.0), 0.5);
      expect(normalizeValue(50, 0, 100), 0.5);
      expect(normalizeValue(0, 0, 100), 0.0);
      expect(normalizeValue(100, 0, 100), 1.0);
    });

    test('clamps value below min to 0.0', () {
      expect(normalizeValue(-10, 0, 100), 0.0);
    });

    test('clamps value above max to 1.0', () {
      expect(normalizeValue(150, 0, 100), 1.0);
    });

    test('returns 0.0 when min equals max', () {
      expect(normalizeValue(5, 5, 5), 0.0);
    });
  });
}
