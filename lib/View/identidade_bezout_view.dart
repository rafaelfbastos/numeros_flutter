import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeros/models/teorema_bezout.dart';
import 'package:validators/validators.dart';

class TeoremaBezoutPage extends StatefulWidget {
  const TeoremaBezoutPage({super.key});

  @override
  State<TeoremaBezoutPage> createState() => _TeoremaBezoutPageState();
}

class _TeoremaBezoutPageState extends State<TeoremaBezoutPage> {
  var formKey = GlobalKey<FormState>();
  var numero1EC = TextEditingController();
  var numero2EC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IDENTIDADE DE BÉZOUT"),
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
                    controller: numero1EC,
                    decoration: InputDecoration(
                      label: const Text("Primeiro nº inteiro:"),
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
                      if (value == numero2EC.text) {
                        return "Digite valores diferentes";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: numero2EC,
                    decoration: InputDecoration(
                      label: const Text("Segundo nº inteiro:"),
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
                      if (value == numero1EC.text) {
                        return "Digite valores diferentes";
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
                        final numero1 = int.parse(numero1EC.text);
                        final numero2 = int.parse(numero2EC.text);
                        final identidadeBezout = TeoremaBezout()
                            .calcularBezout(num1: numero1, num2: numero2);
                        final X0 = identidadeBezout["X0"];
                        final Y0 = identidadeBezout["Y0"];
                        final mdc = identidadeBezout["mdc"];
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                  title: Text(
                                    "Resultado:",
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
                                            text: "COEFICIENTE 1º NÚMERO: ",
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 20,
                                              color: Colors.grey[800],
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "$X0",
                                                  style: GoogleFonts.robotoMono(
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
                                            text: "COEFICIENTE 2º NÚMERO: ",
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 20,
                                              color: Colors.grey[800],
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "$Y0",
                                                  style: GoogleFonts.robotoMono(
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
                                            text: "MDC: ",
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 20,
                                              color: Colors.grey[800],
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "$mdc",
                                                  style: GoogleFonts.robotoMono(
                                                    fontSize: 20,
                                                    color: Colors.red[800],
                                                  )),
                                            ]),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 20),
                                        child: RichText(
                                          text: TextSpan(
                                              text: "\n(",
                                              style: GoogleFonts.robotoMono(
                                                fontSize: 20,
                                                color: Colors.grey[800],
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "$X0",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                                TextSpan(
                                                    text:
                                                        ")·(${numero1EC.text}) + (",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.grey[800],
                                                    )),
                                                TextSpan(
                                                    text: "$Y0",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                                TextSpan(
                                                    text:
                                                        ")·(${numero2EC.text}) = ",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.grey[800],
                                                    )),
                                                TextSpan(
                                                    text: "$mdc",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.red[800],
                                                    )),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text("Fechar"),
                                    )
                                  ]);
                            }); //ShowDialog
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
