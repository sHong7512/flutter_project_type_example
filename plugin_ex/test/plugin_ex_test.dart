import 'package:flutter/src/services/platform_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_ex/cal_method.dart';
import 'package:plugin_ex/plugin_ex.dart';
import 'package:plugin_ex/platforms/cal_platform_interface.dart';
import 'package:plugin_ex/platforms/plus_minus_platform.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginExPlatform
    with MockPlatformInterfaceMixin
    implements CalPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<num?> callMethod(CalMethod method, num x, num y) {
    // TODO: implement callMethod
    throw UnimplementedError();
  }

  @override
  // TODO: implement methodChannel
  MethodChannel get methodChannel => throw UnimplementedError();
}

void main() {
  final CalPlatform initialPlatform = CalPlatform.instance;

  test('$PlusMinusPlatform is the default instance', () {
    expect(initialPlatform, isInstanceOf<PlusMinusPlatform>());
  });

  test('getPlatformVersion', () async {
    PluginEx pluginExPlugin = PluginEx();
    MockPluginExPlatform fakePlatform = MockPluginExPlatform();
    CalPlatform.instance = fakePlatform;

    expect(await pluginExPlugin.getPlatformVersion(), '42');
  });
}
