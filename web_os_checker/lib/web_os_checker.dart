
import 'web_os_checker_platform_interface.dart';

class WebOsChecker {
  Future<String?> getPlatformVersion() {
    return WebOsCheckerPlatform.instance.getPlatformVersion();
  }
}
