import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fixture.dart';

void main() {
  group('Bar signal indicators tests', () {
    testWidgets("Sizing test", (tester) async {
      final widget = createBarSignalStrengthIndicatorSizingTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile("goldens/bars-sizes.png"),
      );
    });

    testWidgets("Value test", (tester) async {
      final widget = createBarSignalStrengthIndicatorValueTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile("goldens/bars-values.png"),
      );
    });

    testWidgets("Range test", (tester) async {
      final widget = createBarSignalStrengthIndicatorRangeTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile("goldens/bars-range.png"),
      );
    });

    testWidgets("Threshold test", (tester) async {
      final widget = createBarSignalStrengthIndicatorThresholdTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile("goldens/bars-threshold.png"),
      );
    });
  });
}
