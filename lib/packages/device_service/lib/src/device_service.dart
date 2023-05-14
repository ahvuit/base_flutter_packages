import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  static Future<bool> checkConnectToNetwork() async {
    final connectResult = await Connectivity().checkConnectivity();
    if (connectResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static Future<String> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model!;
    } else {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
  }
}
