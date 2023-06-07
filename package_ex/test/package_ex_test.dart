import 'package:flutter_test/flutter_test.dart';

import 'package:package_ex/package_ex.dart';

void main() {
  test('plus', () {
    final calculator = PackageEx().calculator;
    expect(calculator.plus(1, 2), 3);
  });
}
