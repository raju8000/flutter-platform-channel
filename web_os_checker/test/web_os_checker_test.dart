import 'package:flutter_test/flutter_test.dart';
import 'package:web_os_checker/web_os_checker.dart';
import 'package:web_os_checker/web_os_checker_platform_interface.dart';
import 'package:web_os_checker/web_os_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebOsCheckerPlatform
    with MockPlatformInterfaceMixin
    implements WebOsCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WebOsCheckerPlatform initialPlatform = WebOsCheckerPlatform.instance;

  test('$MethodChannelWebOsChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWebOsChecker>());
  });

  test('getPlatformVersion', () async {
    WebOsChecker webOsCheckerPlugin = WebOsChecker();
    MockWebOsCheckerPlatform fakePlatform = MockWebOsCheckerPlatform();
    WebOsCheckerPlatform.instance = fakePlatform;

    expect(await webOsCheckerPlugin.getPlatformVersion(), '42');
  });
}
