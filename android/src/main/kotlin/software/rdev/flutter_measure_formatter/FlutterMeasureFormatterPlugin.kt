package software.rdev.flutter_measure_formatter

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

import android.annotation.SuppressLint
import android.app.Activity
import android.icu.text.MeasureFormat
import android.icu.util.Measure
import android.icu.util.MeasureUnit
import android.os.Build

import com.digidemic.unitof.UnitOf
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import java.util.*

/** FlutterMeasureFormatterPlugin */
public class FlutterMeasureFormatterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  private var activity: Activity? = null

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_measure_formatter")
    channel.setMethodCallHandler(this);
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  @SuppressLint("DefaultLocale")
  fun Locale.isMetric(): Boolean {
    return when (country.toUpperCase()) {
      "US", "LR", "MM" -> false
      else -> true
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "formatLength" || call.method == "convertLength") {
      val unit = call.argument<String>("unit")
      var value = call.argument<Double>("value")

      var parsed: MeasureUnit? = null
      val currentLocale = if (activity != null) activity!!.getResources().getConfiguration().locale else Locale.ENGLISH;

      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
        when (unit) {
          "FlutterMeasureFormatterUnit.KILOMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.KILOMETER
            } else {
              parsed = MeasureUnit.MILE
              val kilometres = UnitOf.Length().fromKilometers(value!!);
              value = kilometres.toMiles();
            }
          }
          "FlutterMeasureFormatterUnit.METER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.METER
            } else {
              parsed = MeasureUnit.YARD
              val metres = UnitOf.Length().fromMeters(value!!);
              value = metres.toYards();
            }
          }
          "FlutterMeasureFormatterUnit.DECIMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.DECIMETER
            } else {
              parsed = MeasureUnit.FOOT
              val decimetres = UnitOf.Length().fromDecimeters(value!!);
              value = decimetres.toFeet();
            }
          }
          "FlutterMeasureFormatterUnit.CENTIMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.CENTIMETER
            } else {
              parsed = MeasureUnit.INCH
              val centimetres = UnitOf.Length().fromCentimeters(value!!);
              value = centimetres.toInches();
            }
          }
          "FlutterMeasureFormatterUnit.MILLIMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.MILLIMETER
            } else {
              parsed = MeasureUnit.INCH
              val milimetres = UnitOf.Length().fromMillimeters(value!!);
              value = milimetres.toInches();
            }
          }
          "FlutterMeasureFormatterUnit.MICROMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.MICROMETER
            } else {
              parsed = MeasureUnit.INCH
              val micrometres = UnitOf.Length().fromMicrometers(value!!);
              value = micrometres.toInches();
            }
          }
          "FlutterMeasureFormatterUnit.NANOMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.NANOMETER
            } else {
              parsed = MeasureUnit.INCH
              val nanometres = UnitOf.Length().fromNanometers(value!!);
              value = nanometres.toInches();
            }
          }
          "FlutterMeasureFormatterUnit.PICOMETER" -> {
            if (currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.PICOMETER
            } else {
              parsed = MeasureUnit.INCH
              val picometres = UnitOf.Length().fromPicometers(value!!);
              value = picometres.toInches();
            }
          }
          "FlutterMeasureFormatterUnit.INCH" -> {
            if (!currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.INCH
            } else {
              parsed = MeasureUnit.CENTIMETER
              val inches = UnitOf.Length().fromInches(value!!);
              value = inches.toCentimeters();
            }
          }
          "FlutterMeasureFormatterUnit.FOOT" -> {
            if (!currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.FOOT
            } else {
              parsed = MeasureUnit.DECIMETER
              val feets = UnitOf.Length().fromFeet(value!!);
              value = feets.toDecimeters();
            }
          }
          "FlutterMeasureFormatterUnit.YARD" -> {
            if (!currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.YARD
            } else {
              parsed = MeasureUnit.METER
              val yards = UnitOf.Length().fromYards(value!!);
              value = yards.toMeters();
            }
          }
          "FlutterMeasureFormatterUnit.MILE" -> {
            if (!currentLocale.isMetric() || call.method == "formatLength") {
              parsed = MeasureUnit.MILE
            } else {
              parsed = MeasureUnit.KILOMETER
              val miles = UnitOf.Length().fromMiles(value!!);
              value = miles.toKilometers();
            }
          }
          "FlutterMeasureFormatterUnit.MILE_SCANDINAVIAN" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            parsed = MeasureUnit.MILE_SCANDINAVIAN
          }
          "FlutterMeasureFormatterUnit.LIGHT_YEAR" -> parsed = MeasureUnit.LIGHT_YEAR
          "FlutterMeasureFormatterUnit.NAUTICAL_MILE" -> parsed = MeasureUnit.NAUTICAL_MILE
          "FlutterMeasureFormatterUnit.FATHOM" -> parsed = MeasureUnit.FATHOM
          "FlutterMeasureFormatterUnit.FURLONG" -> parsed = MeasureUnit.FURLONG
          "FlutterMeasureFormatterUnit.ASTRONOMICAL_UNIT" -> parsed = MeasureUnit.ASTRONOMICAL_UNIT
          "FlutterMeasureFormatterUnit.PARSEC" -> parsed = MeasureUnit.PARSEC
        }
        if (parsed != null) {
          val measure = Measure(value, parsed)
          val fmtFr = MeasureFormat.getInstance(currentLocale, MeasureFormat.FormatWidth.SHORT);

          result.success(fmtFr.formatMeasures(measure));
        } else {
          result.success(value.toString());
        }
      } else {
        result.success(value.toString());
      }
    }
    else
    {
      result.notImplemented();
    }
  }


  override fun onDetachedFromActivity() {
    activity = null;
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null;
  }
}
