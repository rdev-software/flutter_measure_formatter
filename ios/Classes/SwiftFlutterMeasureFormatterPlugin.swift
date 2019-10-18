import Flutter
import UIKit

public class SwiftFlutterMeasureFormatterPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_measure_formatter", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterMeasureFormatterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "formatLength" || call.method == "convertLength")
        {
            
            
            
            if let argArray:NSDictionary = call.arguments as? NSDictionary,let value:Double = argArray["value"] as? Double, let unit:String = argArray["unit"] as? String
            {
                if #available(iOS 10.0, *) {
                    let formatter = MeasurementFormatter()
                    formatter.unitStyle = .medium
                    
                    if (call.method == "formatLength")
                    {
                        // Only formatting
                        formatter.unitOptions = .providedUnit
                    }
                    else
                    {
                        // Conversion
                        formatter.unitOptions = .naturalScale
                    }
                    var parsed:UnitLength? = nil;
                    switch unit {
                    case "FlutterMeasureFormatterUnit.KILOMETER":
                        parsed = UnitLength.kilometers;
                        break
                    case "FlutterMeasureFormatterUnit.METER":
                        parsed = UnitLength.meters;
                        break
                    case "FlutterMeasureFormatterUnit.DECIMETER":
                        parsed = UnitLength.decimeters;
                        break
                    case "FlutterMeasureFormatterUnit.CENTIMETER":
                        parsed = UnitLength.centimeters;
                        break
                    case "FlutterMeasureFormatterUnit.MILLIMETER":
                        parsed = UnitLength.millimeters;
                        break
                    case "FlutterMeasureFormatterUnit.MICROMETER":
                        parsed = UnitLength.micrometers;
                        break
                    case "FlutterMeasureFormatterUnit.NANOMETER":
                        parsed = UnitLength.nanometers;
                        break
                    case "FlutterMeasureFormatterUnit.PICOMETER":
                        parsed = UnitLength.picometers;
                        break
                    case "FlutterMeasureFormatterUnit.INCH":
                        parsed = UnitLength.inches;
                        break
                    case "FlutterMeasureFormatterUnit.FOOT":
                        parsed = UnitLength.feet;
                        break
                    case "FlutterMeasureFormatterUnit.YARD":
                        parsed = UnitLength.yards;
                        break
                    case "FlutterMeasureFormatterUnit.MILE":
                        parsed = UnitLength.miles;
                        break
                    case "FlutterMeasureFormatterUnit.MILE_SCANDINAVIAN":
                        parsed = UnitLength.scandinavianMiles;
                        break
                    case "FlutterMeasureFormatterUnit.LIGHT_YEAR":
                        parsed = UnitLength.lightyears;
                        break
                    case "FlutterMeasureFormatterUnit.NAUTICAL_MILE":
                        parsed = UnitLength.nauticalMiles;
                        break
                    case "FlutterMeasureFormatterUnit.FATHOM":
                        parsed = UnitLength.fathoms;
                        break
                    case "FlutterMeasureFormatterUnit.FURLONG":
                        parsed = UnitLength.furlongs;
                        break
                    case "FlutterMeasureFormatterUnit.ASTRONOMICAL_UNIT":
                        parsed = UnitLength.astronomicalUnits;
                        break
                    case "FlutterMeasureFormatterUnit.PARSEC":
                        parsed = UnitLength.parsecs;
                        break
                        
                    default:
                        break
                    }
                    if let parsedUnit:UnitLength = parsed
                    {
                        let resValue = formatter.string(from: Measurement(value: value, unit: parsedUnit))
                        result(resValue)
                    }
                    else
                    {
                        // Formatter not available
                        result("\(value)")
                    }
                } else {
                    // Formatter not available
                    result("\(value)")
                }
            }
            else
            {
                result(FlutterError(code: "500", message: "Invalid arguments", details: call.arguments))
            }
        }
        else
        {
            result(FlutterMethodNotImplemented)
            return
        }
    }
}
