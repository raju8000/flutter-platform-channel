import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:web_os_checker/web_os_checker.dart';

class PlatformHelper {
  static const MethodChannel _channel = MethodChannel('devBlog.platform.com');

  static Future<String> getOSName() async {
    String osName;
    try {
      if(kIsWeb){
        osName = await WebOsChecker().getPlatformVersion()??"";
      }
      else {
        osName = await _channel.invokeMethod('getOSName');
      }
    } catch (e) {
      osName = 'Unsupported OS';
    }
    return osName;
  }
}