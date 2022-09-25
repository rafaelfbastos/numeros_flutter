class MmcMdc {
  final List<int> numeros;
  int? mmc;
  int? mdc;

  MmcMdc(this.numeros);

  MmcMdc.calcular(this.numeros) {
    calcular();
  }

  void calcular() {
    mmc = numeros.reduce(mmcCalc);
    mdc = numeros.reduce(mdcCalc);
  }

  int mdcCalc(int num1, int num2) {
    var dividendo = <int>[];
    var divisor = <int>[];
    var quociente = <int>[];
    var resto = <int>[];
    var a;
    var b;

    if (num1.abs() > num2.abs()) {
      a = num1.abs();
      b = num2.abs();
    } else {
      a = num2.abs();
      b = num1.abs();
    }
    dividendo.add(a);
    divisor.add(b);
    var i = 0;
    var q0 = a ~/ b;
    while (dividendo[i] % divisor[i] != 0) {
      resto.add(dividendo[i] % divisor[i]);
      quociente.add(dividendo[i] ~/ divisor[i]);
      dividendo.add(divisor[i]);
      divisor.add(resto[i]);
      i += 1;
    }
    return divisor[i];
  }

  int mmcCalc(int num1, int num2) {
    var mmc = (num1.abs() * num2.abs()) ~/ mdcCalc(num1, num2);
    return mmc;
  }
}
