# ios_network_info_example

Demonstrates how to use the `ios_network_info` plugin.

## About the example

In the example app, we fetch the SSID and BSSID on start. There's a refresh app bar action that requests the WiFi SSID and BSSID again. When the phone is not connected to a WiFi network, both getters return `null`.

![ios_network_info example app in action](https://github.com/smaho-gmbh/ios_network_info/raw/master/example/ios_network_info.gif)