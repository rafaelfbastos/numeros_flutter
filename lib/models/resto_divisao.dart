class Resto {
  int dividendo;
  int divisor;
  Map<String, int> resultado = {"quociente": 0, "resto": 0};

  Resto({required this.dividendo, required this.divisor}) {
    calcularResposta();
  }
  void calcularResposta() {
    int numerador = dividendo;
    int denominador = divisor;
    int q = 0;
    int r = 0;
    var resposta = <int>[];

    if (numerador >= 0 && denominador > 0) {
      r = numerador % denominador;
      q = (numerador ~/ denominador);
      resposta.add(q);
      resposta.add(r);
    } else if (numerador >= 0 && denominador > 0) {
      while (q * denominador <= numerador) {
        q -= 1;
      }
      r = numerador - (q + 1) * denominador;
      resposta.add(q + 1);
      resposta.add(r);
    } else if (numerador <= 0 && denominador > 0) {
      while (q * denominador > numerador) {
        q -= 1;
      }
      r = numerador - q * denominador;
      resposta.add(q);
      resposta.add(r);
    } else if (numerador <= 0 && denominador < 0) {
      while (q * denominador > numerador) {
        q += 1;
      }
      r = numerador - q * denominador;
      resposta.add(q);
      resposta.add(r);
    }
    resultado["quociente"] = resposta[0];
    resultado["resto"] = resposta[1];
  }
}
