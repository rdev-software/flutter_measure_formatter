#import "FlutterMeasureFormatterPlugin.h"
#if __has_include(<flutter_measure_formatter/flutter_measure_formatter-Swift.h>)
#import <flutter_measure_formatter/flutter_measure_formatter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_measure_formatter-Swift.h"
#endif

@implementation FlutterMeasureFormatterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMeasureFormatterPlugin registerWithRegistrar:registrar];
}
@end
