import 'dart:async';

import 'package:flutter/services.dart';

/// Enable fetching the current WiFi network's BSSID and SSID.
///
/// This is an iOS-only plugin.
class IosNetworkInfo {
  static const MethodChannel _channel = const MethodChannel('ios_network_info');

  /// Return the current WiFi network's BSSID (MAC Address)
  ///
  /// In case the device is not connected to the WiFi, the return value will be
  /// `null`
  ///
  /// Works only on real devices. On iOS 12+, you need to add "Access WiFi
  /// Information" capability to your app.
  static Future<String> get bssid {
    return _channel.invokeMethod('bssid');
  }

  /// Return the current WiFi network's SSID (WiFi Name)
  ///
  /// In case the device is not connected to the WiFi, the return value will be
  /// `null`
  ///
  /// Works only on real devices. On iOS 12+, you need to add "Access WiFi
  /// Information" capability to your app.
  static Future<String> get ssid {
    return _channel.invokeMethod('ssid');
  }
}
