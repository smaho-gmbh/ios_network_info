import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_network_info/ios_network_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('ios_network_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await IosNetworkInfo.platformVersion, '42');
  });
}
