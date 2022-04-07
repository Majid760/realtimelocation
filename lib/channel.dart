import 'dart:async';

import 'package:flutter/services.dart';

class LocationChannel {
  static const MethodChannel _channel = MethodChannel('getLocationOnce');

  // once locaiton method
  static const EventChannel _locationStreamChannel =
      EventChannel('getLocationStream');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  // locationStream
  static Stream<String> get getLocationStream {
    return _locationStreamChannel.receiveBroadcastStream().cast();
  }
}
