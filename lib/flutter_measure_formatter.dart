import 'dart:async';

import 'package:flutter/services.dart';

import 'flutter_measure_formatter_platform_interface.dart';
import 'method_channel_flutter_measure_formatter.dart';

class FlutterMeasureFormatter extends MeasureFormatterPlatform {
  static const MethodChannel _channel =
      const MethodChannel('flutter_measure_formatter');

  @override
  Future<String?> convertLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    return MeasureFormatterPlatform.instance.convertLength(unit, value);
//    final String formattedValue = await _channel.invokeMethod(
//        'convertLength', {"value": value, "unit": unit.toString()});
//    return formattedValue;
  }

  @override
  Future<String?> formatLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    return MeasureFormatterPlatform.instance.formatLength(unit, value);
//    final String formattedValue = await _channel.invokeMethod(
//        'formatLength', {"value": value, "unit": unit.toString()});
//    return formattedValue;
  }
}
