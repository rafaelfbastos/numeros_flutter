import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeros/models/resto_divisao.dart';
import 'package:validators/validators.dart';

class RestoDivisaoPage extends StatefulWidget {
  const RestoDivisaoPage({super.key});

  @override
  State<RestoDivisaoPage> createState() => _RestoDivisaoPageState();
}

class _RestoDivisaoPageState extends State<RestoDivisaoPage> {
  var formKey = GlobalKey<FormState>();
  var dividendoEC = TextEditingController();
  var divisorEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RESTO DA DIVISÃO"),
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
                    controller: dividendoEC,
                    decoration: InputDecoration(
                      label: const Text("Dividendo:"),
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
                    controller: divisorEC,
                    decoration: InputDecoration(
                      label: const Text("Divisor:"),
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
                      if (int.parse(value) == 0) {
                        return "Divisor não pode ser 0";
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
                        final dividendo = int.parse(dividendoEC.text);
                        final divisor = int.parse(divisorEC.text);
                        final resto =
                            Resto(dividendo: dividendo, divisor: divisor)
                                .resultado;
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
                                            text: "QUOCIENTE: ",
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 20,
                                              color: Colors.grey[800],
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "${resto['quociente']}",
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
                                            text: "Resto: ",
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 20,
                                              color: Colors.grey[800],
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "${resto['resto']}",
                                                  style: GoogleFonts.robotoMono(
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
