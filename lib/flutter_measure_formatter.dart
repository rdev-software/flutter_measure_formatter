import 'dart:async';

import 'package:flutter/services.dart';

enum FlutterMeasureFormatterUnit {
  ASTRONOMICAL_UNIT,
  CENTIMETER,
  DECIMETER,
  FATHOM,
  FOOT,
  FURLONG,
  INCH,
  LIGHT_YEAR,
  KILOMETER,
  METER,
  MICROMETER,
  MILE,
  MILE_SCANDINAVIAN,
  MILLIMETER,
  NANOMETER,
  NAUTICAL_MILE,
  PARSEC,
  PICOMETER,
  YARD,
}

class FlutterMeasureFormatter {
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
