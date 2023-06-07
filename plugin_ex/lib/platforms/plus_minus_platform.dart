import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cal_platform_interface.dart';

class PlusMinusPlatform extends CalPlatform {
  @visibleForTesting
  @override
  final methodChannel = const MethodChannel('plugin_plus_minus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
