#import "IosNetworkInfoPlugin.h"
#include "SystemConfiguration/CaptiveNetwork.h"

@implementation IosNetworkInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ios_network_info"
            binaryMessenger:[registrar messenger]];
  IosNetworkInfoPlugin* instance = [[IosNetworkInfoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([call.method isEqualToString:@"bssid"]) {
    result([self getBSSID]);
  } if ([call.method isEqualToString:@"ssid"]) {
    result([self getSSID]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

/**
 Look up network information value by key.
 @param key one of SSID, BSSID (or SSIDData, not used)
 @return the value of the requested network information key
 */
- (NSString*)findNetworkInfo:(NSString*) key {
  NSArray* interfaceNames = (__bridge_transfer id)CNCopySupportedInterfaces();
  for (NSString* interfaceName in interfaceNames) {
    NSDictionary* networkInfo = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName);
    if (networkInfo[key]) {
      return networkInfo[key];
    }
  }
  return nil;
}

/**
 Get BSSID of the current Wi-Fi network
 @return BSSID string, e.g: "22:a1:b2:c3:d4:e5"
 */
- (NSString*)getBSSID {
  return [self findNetworkInfo:@"BSSID"];
}

/**
 Get SSID of the current Wi-Fi network
 @return BSSID string, e.g: "Vince's iPhone"
 */
- (NSString*)getSSID {
  return [self findNetworkInfo:@"SSID"];
}

@end
