import 'package:flutter/services.dart';

class NativeUrlLauncher {
  static const MethodChannel _channel =
  MethodChannel('native_url_launcher');

  static Future<void> openUrl(String url) async {
    try {
      await _channel.invokeMethod('openUrl', {
        'url': url,
      });
    } catch (e) {
      print("Failed to open URL: $e");
    }
  }
}
