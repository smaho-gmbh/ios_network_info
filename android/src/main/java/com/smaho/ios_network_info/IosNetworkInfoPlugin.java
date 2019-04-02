package com.smaho.ios_network_info;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** IosNetworkInfoPlugin */
public class IosNetworkInfoPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "ios_network_info");
    channel.setMethodCallHandler(new IosNetworkInfoPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    // This is an iOS only plugin. For Android, you can take a look at
    // android_wifi_info plugin or the official connectivity plugin
    result.notImplemented();
  }
}
