class TeoremaBezout {
  Map<String, dynamic> divisoesSucessivas(
      {required int num1, required int num2}) {
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
    var mdc = divisor[i];
    return {
      "mdc": mdc,
      "dividendo": dividendo,
      "dividor": divisor,
      "quociente": quociente,
      "resto": resto,
      "n": i,
      "q0": q0
    };
  }

  Map<String, int> calcularBezout({required int num1, required int num2}) {
    var bz = [];
    var a = [];
    var b = [];
    final divisoes = divisoesSucessivas(num1: num1, num2: num2);
    final quociente = divisoes["quociente"];
    final q0 = divisoes["q0"];
    final i = divisoes["n"];

    if (i == 0) {
      a.add(1);
      b.add(1 - q0);

      bz.add(a[0]);
      bz.add(b[0]);
    } else if (i == 1) {
      a.add(1);
      b.add(-quociente[0]);

      bz.add(a[0]);
      bz.add(b[0]);
    } else if (i == 2) {
      a.add(1);
      b.add(-quociente[0]);
      a.add(-quociente[1] * a[0]);
      b.add(1 - b[0] * quociente[1]);

      bz.add(a[1]);
      bz.add(b[1]);
    } else {
      var count = i - 2;
      var idx = 0;
      a.add(1);
      b.add(-quociente[0]);
      a.add(-quociente[1] * a[0]);
      b.add(1 - b[0] * quociente[1]);

      while (count > 0) {
        a.add(a[idx] - quociente[2 + idx] * a[1 + idx]);
        b.add(b[idx] - quociente[2 + idx] * b[1 + idx]);
        count -= 1;
        idx += 1;
      }
      bz.add(a[1 + idx]);
      bz.add(b[1 + idx]);
    }
    var bezout = <String, int>{};

    if (num1.abs() > num2.abs()) {
      bezout = {"X0": bz[0], "Y0": bz[1]};
    } else if (num1.abs() < num2.abs()) {
      bezout = {"X0": bz[1], "Y0": bz[0]};
    }
    if (num1 < 0) bezout["X0"] = -bezout["X0"]!;
    if (num2 < 0) bezout["Y0"] = -bezout["Y0"]!;
    bezout.putIfAbsent("mdc", () => divisoes["mdc"]);

    return bezout;
  }
}
