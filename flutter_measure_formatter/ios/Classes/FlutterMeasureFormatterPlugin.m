#import "FlutterMeasureFormatterPlugin.h"
#import <flutter_measure_formatter/flutter_measure_formatter-Swift.h>

@implementation FlutterMeasureFormatterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMeasureFormatterPlugin registerWithRegistrar:registrar];
}
@end
