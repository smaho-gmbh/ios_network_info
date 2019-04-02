# `ios_network_info`

This is a Dart plugin package for accessing network information from Flutter. This is an iOS-only plugin.

## Usage

```dart
import 'package:ios_network_info/ios_network_info.dart';

getNetworkInfo() async {
  bssid = await IosNetworkInfo.bssid;
  ssid = await IosNetworkInfo.ssid;
}
```

For a working example app, see the [`example` directory](./example/lib/main.dart)

## Limitations

This Flutter plugin relies on [`CNCopyCurrentNetworkInfo`](https://developer.apple.com/documentation/systemconfiguration/1614126-cncopycurrentnetworkinfo) which on iOS 12 and later [requires the `com.apple.developer.networking.wifi-info` entitlement](https://developer.apple.com/documentation/systemconfiguration/1614126-cncopycurrentnetworkinfo).

> (`CNCopyCurrentNetworkInfo`) To use this function in iOS 12 and later, enable the Access WiFi Information capability in Xcode. For more information, see [Access WiFi Information Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_networking_wifi-info).

Requesting this entitlement successfully is only available if you joined the Apple Developers Program.
 
**Add "Access WiFi Information" capability to your app (otherwise, you'll receive `null`s).**

![Don't forget to enable "Access WiFi Information" capability](https://github.com/smaho-gmbh/ios_network_info/raw/master/AccessWifiInformationCapability.png)

Note: "Access WiFi Information" capability is not the same as "Wireless Accessory Configuration".

## Alternatives

* [`connectivity`](https://pub.dartlang.org/packages/connectivity) plugin lets you get the WiFi SSID (`wifiName`). After [my pull request](https://github.com/flutter/plugins/pull/1331) is merged, you can also get the BSSID of the current WiFi network 

## GitHub

The source code is available on GitHub [`smaho-gmbh/ios_network_info`](https://github.com/smaho-gmbh/ios_network_info).

This Flutter plugin is created by the [SMAHO engineering team](https://github.com/smaho-gmbh).