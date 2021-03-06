# :signal_strength: Signal strength indicator widget

[![Pub](https://img.shields.io/pub/v/signal_strength_indicator.svg?style=flat-square)](https://pub.dartlang.org/packages/signal_strength_indicator)
[![Build Status](https://travis-ci.com/janstol/signal_strength_indicator.svg?branch=master)](https://travis-ci.com/janstol/signal_strength_indicator)
[![Demo](https://img.shields.io/badge/demo-WEB-blue)](https://janstol.github.io/signal_strength_indicator/)

Customizable signal strength indicator widget for Flutter.

## Contents
* [Features](#features)
* [Installation](#installation)
* [Usage](#usage)
* [Feature requests and bugs](#feature-requests-and-bugs)

## Features
See the [WEB DEMO](https://janstol.github.io/signal_strength_indicator/).

## [Installation](https://pub.dev/packages/signal_strength_indicator#-installing-tab-)
1. **Depend on it**

Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  signal_strength_indicator: ^0.4.0
```
2. **Install it**

You can install packages from the command line:
```
$ flutter packages get
```
Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

3. **Import it**

Now in your Dart code, you can use:
```dart
import 'package:signal_strength_indicator/signal_strength_indicator.dart';
```

## Usage

### Bars 
```dart
SignalStrengthIndicator.bars(
  value: 0.6,
  size: 50,
  barCount: 4,
  spacing: 0.2,
)
``` 

### Sector 

```dart
SignalStrengthIndicator.sector(
  value: 0.6,
  size: 50,
  barCount: 4,
  spacing: 0.5,
)
``` 

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/janstol/signal_strength_indicator/issues