import 'package:numeros/models/teorema_bezout.dart';

class EquacoesDiofantinas {
  Map<String, dynamic> calcularDiofantinas(int a, int b, int c) {
    final bezout = TeoremaBezout().calcularBezout(num1: a, num2: b);
    var mdc = bezout["mdc"];
    var bezoutX0 = bezout["X0"] ?? 1;
    var bezoutY0 = bezout["Y0"] ?? 1;
    var solucao = (c % mdc! == 0);

    String colocarSinal(int numero) {
      return numero > 0 ? "+ ${numero.abs()}" : "- ${numero.abs()}";
    }

    var resposta = <String, dynamic>{"solução": solucao};

    if (true) {
      var X0 = bezoutX0 * (c ~/ mdc);
      resposta.putIfAbsent("X0", () => X0);
      var Y0 = bezoutY0 * (c ~/ mdc);
      resposta.putIfAbsent("Y0", () => Y0);
      var equacao = "$a·X ${colocarSinal(b)}·Y = $c";
      resposta.putIfAbsent("equacao", () => equacao);
      var VX = "X = $X0 ${colocarSinal(b ~/ mdc)}·k";
      resposta.putIfAbsent("VX", () => VX);
      var VY = "Y = $Y0 ${colocarSinal(-(a ~/ mdc))}·k";
      resposta.putIfAbsent("VY", () => VY);
    }
    return resposta;
  }
}
