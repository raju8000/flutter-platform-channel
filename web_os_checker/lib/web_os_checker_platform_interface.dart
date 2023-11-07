import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'web_os_checker_method_channel.dart';

abstract class WebOsCheckerPlatform extends PlatformInterface {
  /// Constructs a WebOsCheckerPlatform.
  WebOsCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static WebOsCheckerPlatform _instance = MethodChannelWebOsChecker();

  /// The default instance of [WebOsCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelWebOsChecker].
  static WebOsCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WebOsCheckerPlatform] when
  /// they register themselves.
  static set instance(WebOsCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
