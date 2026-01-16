import 'package:flutter/services.dart';

class NativePrefs {
  static const _channel = MethodChannel('native_prefs');

  static Future<void> saveValue(String key, String value) async {
    await _channel.invokeMethod('save', {
      'key': key,
      'value': value,
    });
  }

  static Future<String?> getValue(String key) async {
    return await _channel.invokeMethod('get', {
      'key': key,
    });
  }
}
