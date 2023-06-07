library package_ex;

import 'package:package_ex/calculator.dart';

export 'package:package_ex/calculator.dart';

class PackageEx {
  PackageEx(){
    calculator = PackageCalculator();
  }

  late final PackageCalculator calculator;
  final String name = "Package Ex Calculator";
}
