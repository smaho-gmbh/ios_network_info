import 'dart:async';

import 'package:flutter/services.dart';

class IosNetworkInfo {
  static const MethodChannel _channel = const MethodChannel('ios_network_info');

  static Future<String> get bssid {
    return _channel.invokeMethod('bssid');
  }

  static Future<String> get ssid {
    return _channel.invokeMethod('ssid');
  }
}
