# Signal strength indicator widget

[![Pub](https://img.shields.io/pub/v/signal_strength_indicator.svg?style=flat-square)](https://pub.dev/packages/signal_strength_indicator)
[![CI](https://github.com/janstol/signal_strength_indicator/actions/workflows/ci.yml/badge.svg)](https://github.com/janstol/signal_strength_indicator/actions/workflows/ci.yml)
[![Demo](https://img.shields.io/badge/demo-WEB-blue)](https://janstol.github.io/signal_strength_indicator/)

Customizable signal strength indicator widget for Flutter.

## Contents
* [Requirements](#requirements)
* [Features](#features)
* [Installation](#installation)
* [Usage](#usage)
* [Parameters](#parameters)
* [Feature requests and bugs](#feature-requests-and-bugs)

## Requirements

- Dart SDK: **>=3.0.0**
- Flutter: **>=3.10.0**

## Features

See the [WEB DEMO](https://janstol.github.io/signal_strength_indicator/).

Two visual variants:
- **Bars** — classic stacked bars with optional rounded corners, bevelled style, and spacing
- **Sector** — quarter-circle arc segments with optional rounded caps

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  signal_strength_indicator: ^0.5.0
```

Then run:

```
flutter pub get
```

Import in your Dart code:

```dart
import 'package:signal_strength_indicator/signal_strength_indicator.dart';
```

## Usage

### Bars

```dart
SignalStrengthIndicator.bars(
  value: 0.6,
  size: 40,
  barCount: 4,
  spacing: 0.2,
  activeColor: Colors.green,
  inactiveColor: Colors.grey.shade300,
)
```

### Sector

```dart
SignalStrengthIndicator.sector(
  value: 0.6,
  size: 40,
  barCount: 4,
  spacing: 0.3,
  rounded: true,
)
```

### Custom value range

```dart
SignalStrengthIndicator.bars(
  value: -65,     // e.g. RSSI in dBm
  minValue: -100,
  maxValue: -40,
  size: 40,
)
```

### Threshold-based coloring with `levels`

`levels` is a `Map<num, Color>` mapping absolute thresholds to colors.
A bar/segment becomes active and uses the color of the highest threshold
that is <= the current value.

```dart
SignalStrengthIndicator.bars(
  value: signalValue,
  minValue: 0,
  maxValue: 100,
  size: 40,
  barCount: 3,
  levels: {
    33: Colors.red,
    66: Colors.orange,
    100: Colors.green,
  },
)
```

### Rounded corners and bevelled bars

```dart
// Rounded corners
SignalStrengthIndicator.bars(
  value: 0.7,
  size: 40,
  radius: const Radius.circular(4),
)

// Bevelled (each bar steps up at an angle)
SignalStrengthIndicator.bars(
  value: 0.7,
  size: 40,
  bevelled: true,
)
```

## Parameters

### Common parameters (`bars` and `sector`)

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | `num` | required | Current signal value |
| `minValue` | `num?` | `0.0` | Minimum value of the range |
| `maxValue` | `num?` | `1.0` | Maximum value of the range |
| `size` | `double?` | icon theme size | Width and height of the widget |
| `barCount` | `int` | `3` | Number of bars/segments |
| `activeColor` | `Color?` | green | Color of active bars (when no `levels`) |
| `inactiveColor` | `Color?` | light green | Color of inactive bars |
| `levels` | `Map<num, Color>?` | — | Threshold-to-color mapping (absolute values) |
| `spacing` | `double` | `0.2` / `0.3` | Gap between bars as a fraction of bar size |
| `margin` | `EdgeInsets` | zero | Outer margin around the widget |

### Bars-only parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `radius` | `Radius?` | `Radius.zero` | Corner radius of each bar |
| `bevelled` | `bool` | `false` | Draw bars with an angled top edge |

### Sector-only parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `rounded` | `bool` | `false` | Use rounded arc cap ends |

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/janstol/signal_strength_indicator/issues
