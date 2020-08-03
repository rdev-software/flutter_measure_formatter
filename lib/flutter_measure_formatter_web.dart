import 'dart:async';

// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter_measure_formatter/quantities.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:meta/meta.dart';

import 'flutter_measure_formatter_platform_interface.dart';
import 'method_channel_flutter_measure_formatter.dart';

/// A web implementation of the FlutterMeasureFormatter plugin.
class FlutterMeasureFormatterWeb extends MeasureFormatterPlatform {
  html.Window _window;

  /// A constructor that allows tests to override the window object used by the plugin.
  FlutterMeasureFormatterWeb({@visibleForTesting html.Window window}) {
    _window = window ?? html.window;
  }

  /// Registers this class as the default instance of [MeasureFormatterPlatform].
  static void registerWith(Registrar registrar) {
    MeasureFormatterPlatform.instance = FlutterMeasureFormatterWeb();
  }

  String getUnitString(FlutterMeasureFormatterUnit unit){
    switch (unit){

      case FlutterMeasureFormatterUnit.ASTRONOMICAL_UNIT:
       return "au";
      case FlutterMeasureFormatterUnit.CENTIMETER:
        return "cm";
      case FlutterMeasureFormatterUnit.DECIMETER:
        return "dm";
      case FlutterMeasureFormatterUnit.FATHOM:
        return "fanthom";
      case FlutterMeasureFormatterUnit.FOOT:
        return "ft";
      case FlutterMeasureFormatterUnit.FURLONG:
        return "furlong";
      case FlutterMeasureFormatterUnit.INCH:
        return "in";
      case FlutterMeasureFormatterUnit.LIGHT_YEAR:
       return "ly";
      case FlutterMeasureFormatterUnit.KILOMETER:
        return "km";
      case FlutterMeasureFormatterUnit.METER:
        return "m";
      case FlutterMeasureFormatterUnit.MICROMETER:
       return "μm";
      case FlutterMeasureFormatterUnit.MILE:
       return "mi";
      case FlutterMeasureFormatterUnit.MILE_SCANDINAVIAN:
        return "mil";
      case FlutterMeasureFormatterUnit.MILLIMETER:
        return "mm";
      case FlutterMeasureFormatterUnit.NANOMETER:
        return "nm";
      case FlutterMeasureFormatterUnit.NAUTICAL_MILE:
        return "nmi";
      case FlutterMeasureFormatterUnit.PARSEC:
        return "pc";
      case FlutterMeasureFormatterUnit.PICOMETER:
        return "pm";
      case FlutterMeasureFormatterUnit.YARD:
        return "yd";
    }
    return "";
  }
  @override
  Future<String> convertLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    var qty = Quantities.scalar(value, getUnitString(unit));
    return qty.format();
  }

  @override
  Future<String> formatLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    var qty = Quantities.scalar(value, getUnitString(unit));
    return qty.format();
  }
}
