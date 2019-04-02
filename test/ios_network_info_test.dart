import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_network_info/ios_network_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('ios_network_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'bssid':
          return 'c0:ff:e3:0f:f1:ce';
        case 'ssid':
          return 'Vince\'s iPhone';
        default:
          throw Exception('Unexpected method');
      }
    });
  });

  test('ssid', () async {
    expect(await IosNetworkInfo.ssid, 'Vince\'s iPhone');
  });

  test('bssid', () async {
    expect(await IosNetworkInfo.bssid, 'c0:ff:e3:0f:f1:ce');
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
