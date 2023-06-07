import 'cal_method.dart';
import '../platforms/cal_platform_interface.dart';

class PluginEx {
  Future<String?> getPlatformVersion() {
    return CalPlatform.instance.getPlatformVersion();
  }

  final name = "Plugin Ex Calculator";

  Future<num?> plus(num x, num y) async => await _call(x, y, CalMethod.plus);

  Future<num?> minus(num x, num y) async => await _call(x, y, CalMethod.minus);

  Future<num?> mul(num x, num y) async => await _call(x, y, CalMethod.mul);

  Future<num?> sub(num x, num y) async => await _call(x, y, CalMethod.sub);

  Future<num?> _call(num x, num y, CalMethod calMethod) async {
    CalPlatform.instanceForMethod(calMethod);
    return await CalPlatform.instance.callMethod(calMethod, x, y);
  }
}
