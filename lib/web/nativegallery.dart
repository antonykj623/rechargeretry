import 'package:flutter/services.dart';

class NativeCrop {

  static const channel = MethodChannel("native_crop");

  static Future<String?> pickAndCrop() async {

    final String? path = await channel.invokeMethod("pickImage");

    return path;

  }

}