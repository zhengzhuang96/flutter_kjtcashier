#import "FlutterKjtcashierPlugin.h"
#import <KJTUrlSdk/KJTUrlSdk.h>

@implementation FlutterKjtcashierPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_kjtcashier"
            binaryMessenger:[registrar messenger]];
  FlutterKjtcashierPlugin* instance = [[FlutterKjtcashierPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"kjtcashier_ali_pay" isEqualToString:call.method]) {
      NSString *token = call.arguments[@"token"];
      [KJTUrlSdk launchAliPayWithToken:token completion:^(BOOL success, NSString * _Nonnull message) {
          if (success) {
              result(@"1");
          }else{
              result(message);
          }
      }];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
