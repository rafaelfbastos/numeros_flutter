import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeros/models/equacoes_diofantinas.dart';
import 'package:validators/validators.dart';

class EquacoesDiofantinasPage extends StatefulWidget {
  const EquacoesDiofantinasPage({super.key});

  @override
  State<EquacoesDiofantinasPage> createState() =>
      _EquacoesDiofantinasPageState();
}

class _EquacoesDiofantinasPageState extends State<EquacoesDiofantinasPage> {
  var formKey = GlobalKey<FormState>();
  var aEC = TextEditingController();
  var bEC = TextEditingController();
  var cEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EQUAÇÕES DIOFANTINAS LINEARES"),
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: aEC,
                    decoration: InputDecoration(
                      label: const Text("Coeficiente a:"),
                      focusColor: Colors.grey[800],
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Digite um numero inteiro";
                      }
                      if (!isNumeric(value)) {
                        return "Digite somente nº inteiro:";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: bEC,
                    decoration: InputDecoration(
                      label: const Text("Coeficiente b:"),
                      focusColor: Colors.grey[800],
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Digite um numero inteiro";
                      }
                      if (!isNumeric(value)) {
                        return "Digite somente nº inteiro:";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cEC,
                    decoration: InputDecoration(
                      label: const Text("Coeficiente c:"),
                      focusColor: Colors.grey[800],
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Digite um numero inteiro";
                      }
                      if (!isNumeric(value)) {
                        return "Digite somente nº inteiro:";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        final a = int.parse(aEC.text);
                        final b = int.parse(bEC.text);
                        final c = int.parse(cEC.text);
                        final diofantinas =
                            EquacoesDiofantinas().calcularDiofantinas(a, b, c);
                        final solucao = diofantinas["solução"] as bool;
                        if (solucao) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                    title: Text(
                                      "Equação: ${diofantinas['equacao']}",
                                      style: GoogleFonts.robotoMono(
                                        fontSize: 20,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: RichText(
                                          text: TextSpan(
                                              text: "X= ",
                                              style: GoogleFonts.robotoMono(
                                                fontSize: 20,
                                                color: Colors.grey[800],
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        "${diofantinas['X0']}",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                                TextSpan(
                                                    text: "  ->  ",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.grey[800],
                                                    )),
                                                TextSpan(
                                                    text:
                                                        "${diofantinas['VX']}",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                              ]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 20),
                                        child: RichText(
                                          text: TextSpan(
                                              text: "Y= ",
                                              style: GoogleFonts.robotoMono(
                                                fontSize: 20,
                                                color: Colors.grey[800],
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        "${diofantinas['Y0']}",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                                TextSpan(
                                                    text: "  ->  ",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.grey[800],
                                                    )),
                                                TextSpan(
                                                    text:
                                                        "${diofantinas['VY']}",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                              ]),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text("Fechar"),
                                      )
                                    ]);
                              }); //ShowDialog
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                    title: Text(
                                      "Equação: ${diofantinas['equacao']}",
                                      style: GoogleFonts.robotoMono(
                                        fontSize: 20,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Não existe solução inteira",
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 20,
                                              color: Colors.red[800],
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text("Fechar"),
                                      )
                                    ]);
                              });
                        }
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
