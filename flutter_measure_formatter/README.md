# flutter_measure_formatter

Simple implementation of units conversion and formatting using native classes.
On Android using [MeasureFormat](https://developer.android.com/reference/android/icu/text/MeasureFormat)
On iOS using [Measurementformatter](https://developer.apple.com/documentation/foundation/measurementformatter)

## Usage
To use this plugin, add `flutter_measure_formatter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Getting Started

Plugin is supported from iOS10+ and Android N+

### Example

``` dart
// Import package
import 'package:flutter_measure_formatter/flutter_measure_formatter.dart';

// To obtain formatted or converted unit
 _formattingResult =
          await FlutterMeasureFormatter.formatLength(FlutterMeasureFormatterUnit.METER, 5);
 _conversionResult =
          await FlutterMeasureFormatter.convertLength(FlutterMeasureFormatterUnit.METER, 5);
```