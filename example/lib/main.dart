import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios_network_info/ios_network_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _bssid = 'Unknown BSSID';
  String _ssid = 'Unknown SSID';

  @override
  void initState() {
    super.initState();
    fetchAll();
  }

  fetchAll() {
    fetchBssid();
    fetchSsid();
  }

  fetchBssid() async {
    String bssid;
    try {
      bssid = await IosNetworkInfo.bssid;
    } on PlatformException {
      bssid = 'Failed to get WiFi BSSID.';
    }
    setBssid(bssid);
  }

  setBssid(String bssid) {
    if (!mounted) return;
    setState(() {
      _bssid = bssid;
    });
  }

  fetchSsid() async {
    String ssid;
    try {
      ssid = await IosNetworkInfo.ssid;
    } on PlatformException {
      ssid = 'Failed to get WiFi SSID.';
    }
    setSsid(ssid);
  }

  setSsid(String ssid) {
    if (!mounted) return;
    setState(() {
      _ssid = ssid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('ios_network_info'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: fetchAll,
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SSID: $_ssid',
                style: Theme.of(context).textTheme.headline,
              ),
              SizedBox(height: 12),
              Text(
                'BSSID: $_bssid',
                style: Theme.of(context).textTheme.headline,
              ),
              SizedBox(height: 20),
              Text('ios_network_info'),
              Text('Flutter plugin example'),
            ],
          ),
        ),
      ),
    );
  }
}
