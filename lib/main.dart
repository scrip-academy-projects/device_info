import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AndroidDeviceInfo? androidInfo;
  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  Widget showCard(String name, String value) {
    return Card(
      child: ListTile(
        title: Text(
          "$name : $value",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder<AndroidDeviceInfo>(
      future: getInfo(),
      builder: (context, snapshot) {
        final data = snapshot.data!;
        return Column(
          children: [
            showCard('brand', data.brand!),
            showCard('device', data.device!),
            showCard('model', data.model!),
            showCard('manufacturer', data.manufacturer!),
            showCard('product', data.product!),
            showCard('hardware', data.hardware!),
            showCard('isPhysicalDevice', data.isPhysicalDevice.toString()),
            showCard('version', data.version.release.toString()),
          ],
        );
      },
    )));
  }
}
