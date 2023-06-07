#import "PluginExPlugin.h"
#if __has_include(<plugin_ex/plugin_ex-Swift.h>)
#import <plugin_ex/plugin_ex-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_ex-Swift.h"
#endif

@implementation PluginExPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginExPlugin registerWithRegistrar:registrar];
}
@end
