import 'dart:async';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'method_channel_flutter_measure_formatter.dart';

/// The interface that implementations of flutter_measure_formatter must implement.
///
/// Platform implementations should extend this class rather than implement it as `flutter_measure_formatter`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [MeasureFormatterPlatform] methods.
abstract class MeasureFormatterPlatform extends PlatformInterface {
  /// Constructs a MeasureFormatterPlatform.
  MeasureFormatterPlatform() : super(token: _token);

  static final Object _token = Object();

  static MeasureFormatterPlatform _instance =
      MethodChannelFlutterMeasureFormatter();

  /// The default instance of [MeasureFormatterPlatform] to use.
  ///
  /// Defaults to [MethodChannelMeasureFormatter].
  static MeasureFormatterPlatform get instance => _instance;

  static set instance(MeasureFormatterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns converted [value] to string value based on selected [unit] based on your regional settings.
  Future<String?> convertLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    throw UnimplementedError('convertLength() has not been implemented.');
  }

  /// Returns formatted [value] as string based on selected [unit].
  Future<String?> formatLength(
      FlutterMeasureFormatterUnit unit, double value) async {
    throw UnimplementedError('formatLength() has not been implemented.');
  }
}
