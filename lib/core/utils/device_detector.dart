import 'dart:io';
import 'package:flutter/foundation.dart';

class DeviceDetector {
  static String getDeviceType() {
    if (kIsWeb) return "web";
    if (Platform.isAndroid) return "android";
    if (Platform.isIOS) return "ios";
    if (Platform.isMacOS) return "macos";
    if (Platform.isWindows) return "windows";
    return "unknown";
  }
}
