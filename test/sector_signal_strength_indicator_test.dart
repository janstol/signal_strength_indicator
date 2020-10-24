import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'bar_fixture.dart';
import 'sector_fixture.dart';

void main() {
  group('Bar signal indicators tests', () {
    testWidgets('Sizing test', (tester) async {
      final widget = createSectorSignalStrengthIndicatorSizingTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/sector-sizes.png'),
      );
    });

    testWidgets('Value test', (tester) async {
      final widget = createSectorSignalStrengthIndicatorValueTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/sector-values.png'),
      );
    });

    testWidgets('Range test', (tester) async {
      final widget = createSectorSignalStrengthIndicatorRangeTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/sector-range.png'),
      );
    });

    testWidgets('Levels test', (tester) async {
      final widget = createSectorSignalStrengthIndicatorLevelsTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/sector-levels.png'),
      );
    });
  });
}
