import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeros/models/conversor_base.dart';

class ConversorBasePage extends StatefulWidget {
  const ConversorBasePage({super.key});

  @override
  State<ConversorBasePage> createState() => _ConversorBasePageState();
}

class _ConversorBasePageState extends State<ConversorBasePage> {
  final formKey = GlobalKey<FormState>();
  var numeroEC = TextEditingController();
  String resultado = "";
  int baseAtual = 2;
  int baseDesejada = 2;

  @override
  void dispose() {
    super.dispose();
    numeroEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CONVERSOR DE BASE NUMÉRICA"),
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
                    controller: numeroEC,
                    decoration: InputDecoration(
                      label: const Text("Número:"),
                      focusColor: Colors.grey[800],
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    validator: (String? value) {
                      String numero = value ?? "";
                      if (value == null || value.isEmpty) {
                        return "Digite um valor";
                      }
                      return ConversorBase(
                              numero: numero,
                              baseAtual: baseAtual,
                              baseDesejada: baseDesejada)
                          .validar();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    value: baseAtual,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Base atual:"),
                      focusColor: Colors.grey[800],
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) baseAtual = newValue;
                    },
                    items: const [
                      DropdownMenuItem(value: 2, child: Text("2")),
                      DropdownMenuItem(value: 3, child: Text("3")),
                      DropdownMenuItem(value: 4, child: Text("4")),
                      DropdownMenuItem(value: 5, child: Text("5")),
                      DropdownMenuItem(value: 6, child: Text("6")),
                      DropdownMenuItem(value: 7, child: Text("7")),
                      DropdownMenuItem(value: 8, child: Text("8")),
                      DropdownMenuItem(value: 9, child: Text("9")),
                      DropdownMenuItem(value: 10, child: Text("10")),
                      DropdownMenuItem(value: 16, child: Text("Hexadecimal")),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    value: baseDesejada,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Base Desejada:"),
                      focusColor: Colors.grey[800],
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) baseDesejada = newValue;
                    },
                    items: const [
                      DropdownMenuItem(value: 2, child: Text("2")),
                      DropdownMenuItem(value: 3, child: Text("3")),
                      DropdownMenuItem(value: 4, child: Text("4")),
                      DropdownMenuItem(value: 5, child: Text("5")),
                      DropdownMenuItem(value: 6, child: Text("6")),
                      DropdownMenuItem(value: 7, child: Text("7")),
                      DropdownMenuItem(value: 8, child: Text("8")),
                      DropdownMenuItem(value: 9, child: Text("9")),
                      DropdownMenuItem(value: 10, child: Text("10")),
                      DropdownMenuItem(value: 16, child: Text("Hexadecimal")),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var formValid =
                            formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          var numero = numeroEC.text;
                          var calcular = ConversorBase(
                              numero: numero,
                              baseAtual: baseAtual,
                              baseDesejada: baseDesejada);
                          calcular.calcularResultado();
                          resultado = calcular.resultado;
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
                                        child: Text(
                                          resultado,
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 20,
                                            color: Colors.red[800],
                                          ),
                                          textAlign: TextAlign.center,
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
                      },
                      child: const Text("Calcular")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
