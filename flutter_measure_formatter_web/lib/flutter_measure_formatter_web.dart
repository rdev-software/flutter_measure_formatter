import 'dart:async';
import 'dart:html' as html;

import 'package:flutter_measure_formatter_platform_interface/flutter_measure_formatter_platform_interface.dart';
import 'package:flutter_measure_formatter_platform_interface/method_channel_flutter_measure_formatter.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:meta/meta.dart';


/// The web implementation of [MeasureFormatterPlatform].
///
/// This class implements the `package:url_launcher` functionality for the web.
class FlutterMeasureFormatter extends MeasureFormatterPlatform {
  html.Window _window;

  /// A constructor that allows tests to override the window object used by the plugin.
  FlutterMeasureFormatter({@visibleForTesting html.Window window})
      : _window = window ?? html.window;

  /// Registers this class as the default instance of [MeasureFormatterPlatform].
  static void registerWith(Registrar registrar) {
    MeasureFormatterPlatform.instance = FlutterMeasureFormatter();
  }

  @override
  Future<String> convertLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    throw UnimplementedError('convertLength() has not been implemented.');
  }

  @override
  Future<String> formatLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    throw UnimplementedError('formatLength() has not been implemented.');
  }
}
