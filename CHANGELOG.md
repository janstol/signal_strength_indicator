# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added optional `minimumActiveValue` for fractional first-segment thresholds while preserving the existing default.

### Fixed

- Fixed `SignalStrengthIndicatorStyle.hashCode` for equal `levels` maps with different insertion orders.

## [0.5.0] - 2026-04-10

### Added

- Added unit tests for `normalizeValue` and `normalizedLevels`.

### Changed

- **BREAKING:** Migrated to Dart 3 and Flutter 3. The Dart SDK constraint is now `>=3.0.0 <4.0.0`.
- Replaced the `lint` package with `flutter_lints` for Dart 3 compatibility.
- Updated constructors to use `super` parameters.
- Expanded the README with parameter documentation and usage examples.

### Removed

- Removed deprecated `strong-mode` analyzer options and redundant imports.

### Fixed

- Fixed division by zero when `minValue == maxValue`.
- Fixed `shouldRepaint` to compare all style properties so color and level changes repaint.
- Fixed a null dereference on `IconTheme.size` by falling back to `24.0`.
- Made bars active when `value >= threshold` instead of requiring `value > threshold`.
- Clamped normalized values to the 0.0–1.0 range.
- Preserved user-provided `levels` when their count differs from `barCount`.
- Moved `clipRect` outside the draw loop in the sector painter.
- Fixed variable shadowing in the sector painter.

## [0.4.1] - 2021-09-28

### Fixed

- Fixed [widget not rendering on value change](https://github.com/janstol/signal_strength_indicator/issues/2) (thanks to @casabian for the [contribution](https://github.com/janstol/signal_strength_indicator/pull/3)).

## [0.4.0] - 2021-03-06

### Changed

- Migrated to stable null safety.

## [0.4.0-nullsafety.0] - 2020-12-15

### Changed

- Migrated to beta null safety.

## [0.3.1] - 2020-10-24

### Changed

- Moved `barCount` and `levels` to `SignalStrengthIndicatorStyle` and added the `normalizedValue` and `normalizedLevels` getters.

### Fixed

- Fixed `levels` so keys are absolute values within the `minValue`–`maxValue` range and are normalized later.

## [0.3.0+1] - 2020-05-09

### Changed

- Updated the lint package and example, and fixed lints.

## [0.3.0] - 2019-12-18

### Added

- Added the sector signal indicator (`SignalStrengthIndicator.sector`).

### Changed

- **BREAKING:** Renamed `thresholds` to `levels`.
- Tweaked bevelled bars.

## [0.2.0] - 2019-12-02

### Added

- Added the `bevelled` option to the bar signal indicator.

## [0.1.0] - 2019-11-29

### Added

- Released the bar signal indicator (`SignalStrengthIndicator.bars`).

[Unreleased]: https://github.com/janstol/signal_strength_indicator/compare/0.5.0...HEAD
[0.5.0]: https://pub.dev/packages/signal_strength_indicator/versions/0.5.0
[0.4.1]: https://pub.dev/packages/signal_strength_indicator/versions/0.4.1
[0.4.0]: https://pub.dev/packages/signal_strength_indicator/versions/0.4.0
[0.4.0-nullsafety.0]: https://pub.dev/packages/signal_strength_indicator/versions/0.4.0-nullsafety.0
[0.3.1]: https://pub.dev/packages/signal_strength_indicator/versions/0.3.1
[0.3.0+1]: https://pub.dev/packages/signal_strength_indicator/versions/0.3.0%2B1
[0.3.0]: https://pub.dev/packages/signal_strength_indicator/versions/0.3.0
[0.2.0]: https://pub.dev/packages/signal_strength_indicator/versions/0.2.0
[0.1.0]: https://pub.dev/packages/signal_strength_indicator/versions/0.1.0
