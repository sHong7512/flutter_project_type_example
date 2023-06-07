import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cal_platform_interface.dart';

class MulSubPlatform extends CalPlatform {
  @visibleForTesting
  @override
  final methodChannel = const MethodChannel('plugin_mul_sub');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
