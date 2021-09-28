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