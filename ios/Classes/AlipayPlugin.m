#import "AlipayPlugin.h"
#import "AlipaySDK/AlipaySDK.h"

@implementation AlipayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"alipay"
                                     binaryMessenger:[registrar messenger]];
    AlipayPlugin* instance = [[AlipayPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"alipay" isEqualToString:call.method]){
        NSString* urlScheme = [call.arguments objectForKey:@"urlScheme"];
        NSString* paymentString = [call.arguments objectForKey:@"paymentString"];
        [[AlipaySDK defaultService] payOrder:paymentString fromScheme:urlScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            result(resultDic);
        }];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
