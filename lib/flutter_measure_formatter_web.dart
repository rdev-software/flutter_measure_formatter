import 'dart:async';

// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:meta/meta.dart';

import 'flutter_measure_formatter_platform_interface.dart';
import 'method_channel_flutter_measure_formatter.dart';

/// A web implementation of the FlutterMeasureFormatter plugin.
class FlutterMeasureFormatterWeb extends MeasureFormatterPlatform {
  html.Window _window;

  /// A constructor that allows tests to override the window object used by the plugin.
  FlutterMeasureFormatterWeb({@visibleForTesting html.Window window})
      : _window = window ?? html.window;

  /// Registers this class as the default instance of [UrlLauncherPlatform].
  static void registerWith(Registrar registrar) {
    MeasureFormatterPlatform.instance = FlutterMeasureFormatterWeb();
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
