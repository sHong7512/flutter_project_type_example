enum CalMethod { plus, minus, mul, sub }

extension CalMethodExtension on CalMethod {
  String get method {
    switch (this) {
      case CalMethod.plus:
        return "plus";
      case CalMethod.minus:
        return "minus";
      case CalMethod.mul:
        return "mul";
      case CalMethod.sub:
        return "sub";
    }
  }
}
