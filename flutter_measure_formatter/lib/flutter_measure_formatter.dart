import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_measure_formatter_platform_interface/flutter_measure_formatter_platform_interface.dart';
import 'package:flutter_measure_formatter_platform_interface/method_channel_flutter_measure_formatter.dart';
export 'package:flutter_measure_formatter_platform_interface/method_channel_flutter_measure_formatter.dart';

class FlutterMeasureFormatter extends MeasureFormatterPlatform {
  static const MethodChannel _channel =
      const MethodChannel('flutter_measure_formatter');

  static Future<String> convertLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    final String formattedValue = await _channel.invokeMethod(
        'convertLength', {"value": value, "unit": unit.toString()});
    return formattedValue;
  }

  static Future<String> formatLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    final String formattedValue = await _channel.invokeMethod(
        'formatLength', {"value": value, "unit": unit.toString()});
    return formattedValue;
  }
}