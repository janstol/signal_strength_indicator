## [0.5.0] - 2026-04-10
* **BREAKING**: migrated to Dart 3 / Flutter 3 (SDK constraint >=3.0.0 <4.0.0)
* Replaced `lint` package with `flutter_lints` for Dart 3 compatibility
* Removed deprecated `strong-mode` analyzer options
* Fixed division by zero when `minValue == maxValue`
* Fixed `shouldRepaint` to compare all style properties (previously only `value` was checked, preventing repaints on color/level changes)
* Fixed null dereference on `IconTheme.size` — falls back to `24.0`
* Fixed threshold comparison: bars are now active when `value >= threshold` (was strict `>`)
* Added value clamping in `normalizeValue` to 0.0–1.0 range
* Fixed user-provided `levels` being silently discarded when count != `barCount`
* Moved `clipRect` outside the draw loop in sector painter
* Fixed variable shadowing in sector painter
* Removed redundant imports (`widgets.dart`, `cupertino.dart`)
* Updated constructors to use `super` parameters (Dart 3 style)
* Added unit tests for `normalizeValue` and `normalizedLevels`
* Updated README with full parameter documentation and more usage examples

## [0.4.1] - 2021-09-28
* Fixed [Widget not rendered on value change](https://github.com/janstol/signal_strength_indicator/issues/2) (thanks @casabian for [contribution](https://github.com/janstol/signal_strength_indicator/pull/3))

## [0.4.0] - 2021-03-06
* migrated to nullsafety (stable)

## [0.4.0-nullsafety.0] - 2020-12-15
* migrated to nullsafety (beta)

## [0.3.1] - 2020-10-24
* bug fix for `levels` - levels should be absolute values from `minValue` to `maxValue` range (and they are normalized later)
* refactoring 
  * moved `barCount` and `levels` to `SignalStrengthIndicatorStyle`
  * added `normalizedValue` and `normalizedLevels` getters to `SignalStrengthIndicatorStyle`

## [0.3.0+1] - 2020-05-09
* minor update (updated lint package, fixed lints, updated example)

## [0.3.0] - 2019-12-18
* tweaked bevelled bars
* **BREAKING CHANGE**: changed `thresholds` to `levels`
* added **sector signal indicator** (`SignalStrengthIndicator.sector`)

## [0.2.0] - 2019-12-02
* added `bevelled` option to bar signal indicator

## [0.1.0] - 2019-11-29
* first release
* **bar signal indicator** (`SignalStrengthIndicator.bars`)
