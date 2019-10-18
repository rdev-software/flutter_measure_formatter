package software.rdev.flutter_measure_formatter

import android.annotation.SuppressLint
import android.app.Activity
import android.icu.text.MeasureFormat
import android.icu.util.Measure
import android.icu.util.MeasureUnit
import android.os.Build
import com.digidemic.unitof.UnitOf
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

class FlutterMeasureFormatterPlugin(val activity: Activity) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_measure_formatter")
            channel.setMethodCallHandler(FlutterMeasureFormatterPlugin(registrar.activity()))
        }
    }

    @SuppressLint("DefaultLocale")
    fun Locale.isMetric(): Boolean {
        return when (country.toUpperCase()) {
            "US", "LR", "MM" -> false
            else -> true
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "formatLength" || call.method == "convertLength") {
            val unit = call.argument<String>("unit")
            var value = call.argument<Double>("value")

            var parsed: MeasureUnit? = null
            val currentLocale = activity.getResources().getConfiguration().locale

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
}
