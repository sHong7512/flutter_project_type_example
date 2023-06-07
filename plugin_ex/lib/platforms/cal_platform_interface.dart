import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../cal_method.dart';
import 'mul_sub_platform.dart';
import 'plus_minus_platform.dart';

abstract class CalPlatform extends PlatformInterface {
  /// Constructs a PluginExPlatform.
  CalPlatform() : super(token: _token);

  static final Object _token = Object();

  static CalPlatform _instance = PlusMinusPlatform();

  /// The default instance of [CalPlatform] to use.
  ///
  /// Defaults to [PlusMinusPlatforms].
  static CalPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CalPlatform] when
  /// they register themselves.
  static set instance(CalPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  static instanceForMethod(CalMethod calMethod) {
    if (calMethod == CalMethod.plus || calMethod == CalMethod.minus) {
      if (instance is! PlusMinusPlatform) {
        _instance = PlusMinusPlatform();
      }
    } else if (calMethod == CalMethod.mul || calMethod == CalMethod.sub) {
      if (instance is! MulSubPlatform) {
        _instance = MulSubPlatform();
      }
    } else {
      throw Exception('Undefined Method');
    }
  }

  abstract final MethodChannel methodChannel;

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<num?> callMethod(CalMethod method, num x, num y) async {
    final args = <String, num>{"x": x, "y": y};
    return await methodChannel.invokeMethod(method.name, args) as num;
  }
}
