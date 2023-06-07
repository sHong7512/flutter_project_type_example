import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_ex/platforms/cal_platform_interface.dart';
import 'package:plugin_ex/platforms/plus_minus_platform.dart';

void main() {
  PlusMinusPlatform platform = PlusMinusPlatform();
  const MethodChannel channel = MethodChannel('plugin_ex');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
