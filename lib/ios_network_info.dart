import 'dart:async';

import 'package:flutter/services.dart';

class IosNetworkInfo {
  static const MethodChannel _channel =
      const MethodChannel('ios_network_info');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
