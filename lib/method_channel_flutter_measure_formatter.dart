import 'dart:async';
import 'package:flutter/services.dart';
import 'flutter_measure_formatter_platform_interface.dart';

const MethodChannel _channel =
    MethodChannel('flutter_measure_formatter');

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

/// An implementation of [MeasureFormatterPlatform] that uses method channels.
class MethodChannelFlutterMeasureFormatter extends MeasureFormatterPlatform {
  @override
  Future<String> convertLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    return _channel.invokeMethod<String>(
      'convertLength',
      <String, Object>{'unit': unit.toString(), 'value': value},
    );
  }

  @override
  Future<String> formatLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    return _channel.invokeMethod<String>(
      'formatLength',
      <String, Object>{'unit': unit.toString(), 'value': value},
    );
  }
}
