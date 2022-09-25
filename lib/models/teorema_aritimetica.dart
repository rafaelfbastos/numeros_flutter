// ignore_for_file: public_member_api_docs, sort_constructors_first
class TeoremaAritimetica {
  final mapSobrescrito = {
    48: "⁰",
    49: "¹",
    50: "²",
    51: "³",
    52: "⁴",
    53: "⁵",
    54: "⁶",
    55: "⁷",
    56: "⁸",
    57: "⁹"
  };
  int numero;
  TeoremaAritimetica({required this.numero});

  String calcularDivisores(int nume) {
    var numero = nume.abs();
    var divisoresPositivos = <int>[];

    for (var i = 1; i <= numero; i++) {
      if (numero % i == 0) divisoresPositivos.add(i);
    }
    var divisoresNegativos = divisoresPositivos.map((e) => -e).toList();
    var divisores = [...divisoresNegativos, ...divisoresPositivos];

    return "D($nume) = $divisores";
  }

  bool validarPrimo(int num) {
    var cont = 0;
    for (var i = 1; i <= num; i++) {
      if (num % i == 0) cont++;
    }
    return (cont == 2) ? true : false;
  }

  int retornarPrimo(int pos) {
    var i = 0;
    var primo = 0;
    var cont = 2;

    while (i < pos) {
      if (validarPrimo(cont)) {
        i += 1;
        primo = cont;
      }
      cont += 1;
    }
    return primo;
  }

  Map<int, int> mapBasesPotencias(int num) {
    var numero = num.abs();
    var bases = <int>[];
    var i = 1;

    while (numero != 1) {
      if (numero % retornarPrimo(i) == 0) {
        bases.add(retornarPrimo(i));
        numero ~/= retornarPrimo(i);
      } else {
        i++;
      }
    }

    var setBases = bases.toSet();

    var resutado = <int, int>{};

    setBases.forEach((element) => resutado.putIfAbsent(
        element, () => (bases.where((e) => e == element)).length));
    return resutado;
  }

  @override
  String toString() {
    var resultado = mapBasesPotencias(numero);
    var texto = StringBuffer();
    texto.write("$numero =");
    texto.write((numero > 0) ? " " : " -");
    resultado.forEach((key, value) {
      var valueList = "$value".codeUnits;
      var valueMap =
          valueList.map((e) => "${mapSobrescrito[e]}").toList().join("");
      texto.write("$key$valueMap∙");
    });

    return texto.toString().substring(0, texto.length - 1);
  }
}
