import 'dart:math';

class ConversorBase {
  String numero;
  int baseAtual;
  int baseDesejada;
  var resultado = "";

  final mapCaracteres = {
    48: 0,
    49: 1,
    50: 2,
    51: 3,
    52: 4,
    53: 5,
    54: 6,
    55: 7,
    56: 8,
    57: 9,
    97: 10,
    98: 11,
    99: 12,
    100: 13,
    101: 14,
    102: 15,
  };
  var hexDict = {
    10: "A",
    11: "B",
    12: "C",
    13: "D",
    14: "E",
    15: "F",
    0: "0",
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9"
  };

  ConversorBase({
    required this.numero,
    required this.baseAtual,
    required this.baseDesejada,
  });

  int calcularNto10(String numero) {
    List<int?> listAlgarismos = numero.toLowerCase().codeUnits;

    listAlgarismos = listAlgarismos.map((e) => mapCaracteres[e]).toList();

    var index = 0;
    var resultado = <int>[];

    for (var i = listAlgarismos.length - 1; i >= 0; i--) {
      resultado.add(listAlgarismos[i]! * pow(baseAtual, index).toInt());
      index++;
    }
    return resultado.reduce((v, e) => v + e);
  }

  String calcular10ToN(int numero) {
    var resultado = [];
    var inteiro = numero;
    while (inteiro >= baseDesejada) {
      resultado.add(inteiro % baseDesejada);
      inteiro ~/= baseDesejada;
    }
    resultado.add(inteiro);
    resultado = resultado.reversed.toList();

    return resultado.map((e) => hexDict[e]).join("");
  }

  String? validar() {
    String? retorno;
    List<int?> listAlgarismos = numero.toLowerCase().codeUnits;

    for (int? numero in listAlgarismos) {
      if (!mapCaracteres.containsKey(numero)) return "Caracteres Invalidos";
    }
    listAlgarismos = listAlgarismos.map((e) => mapCaracteres[e]).toList();
    if (listAlgarismos.any((element) => element! >= baseAtual))
      return "Número não condiz com a base";
    return null;
  }

  void calcularResultado() {
    var base10 = calcularNto10(numero);
    resultado =
        (baseDesejada == 10) ? base10.toString() : calcular10ToN(base10);
  }
}
