import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeros/models/mmc_mdc.dart';
import 'package:numeros/models/teorema_aritimetica.dart';

class MmcMdcPage extends StatefulWidget {
  const MmcMdcPage({super.key});

  @override
  State<MmcMdcPage> createState() => _MmcMdcPageState();
}

class _MmcMdcPageState extends State<MmcMdcPage> {
  var formKey = GlobalKey<FormState>();
  var numerosEC = TextEditingController();

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
                      controller: numerosEC,
                      decoration: InputDecoration(
                        label: const Text("NÚMEROS - (Separados por espaços:)"),
                        focusColor: Colors.grey[800],
                        labelStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      validator: ((String? value) {
                        if (value == null || value.isEmpty) {
                          return "Digite números inteiros e diferente de 0";
                        }
                        var numeros = converter(value);
                        if (numeros == null || numeros.length == 1) {
                          return 'Digite números inteiros e diferente de 0';
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            child: Text(
                              "MDC e MDC",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              //mostar mmc mdc
                              var formValidation =
                                  formKey.currentState?.validate() ?? false;
                              if (formValidation) {
                                var numeros = converter(numerosEC.text) ?? [];
                                numeros = numeros.map((e) => e).toList();
                                var resultado =
                                    MmcMdc.calcular(List<int>.from(numeros));
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                          title: Text(
                                            "Resultado de $numeros",
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
                                                    text: "MMC: ",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.grey[800],
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              "${resultado.mmc}",
                                                          style: GoogleFonts
                                                              .robotoMono(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.red[800],
                                                          )),
                                                    ]),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 0, 20, 20),
                                              child: RichText(
                                                text: TextSpan(
                                                    text: "MDC: ",
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 20,
                                                      color: Colors.grey[800],
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              "${resultado.mdc}",
                                                          style: GoogleFonts
                                                              .robotoMono(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.red[800],
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
                                    });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            child: Text(
                              "DECOMPOSIÇÃO EM FATORES PRIMOS",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              //Decomposoção
                              var formValidation =
                                  formKey.currentState?.validate() ?? false;
                              if (formValidation) {
                                var numeros = converter(numerosEC.text) ?? [];
                                numeros = numeros.map((e) => e).toList();
                                var resultado = numeros
                                    .map((e) => TeoremaAritimetica(numero: e)
                                        .toString())
                                    .toList();
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Dialog(
                                        child: SizedBox(
                                          height: 400,
                                          width: 400,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text("Resultados:",
                                                      style: GoogleFonts
                                                          .robotoMono(
                                                        fontSize: 20,
                                                        color: Colors.grey[800],
                                                      )),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: ListView.builder(
                                                  itemCount: resultado.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Text(
                                                          resultado[index],
                                                          style: GoogleFonts
                                                              .robotoMono(
                                                            fontSize: 20,
                                                            color: Colors
                                                                .grey[800],
                                                          )),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: const Text("Fechar"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            child: Text(
                              "DIVISORES",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              var formValid =
                                  formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                var numeros = converter(numerosEC.text) ?? [];
                                numeros = numeros.map((e) => e).toList();
                                var divisores = numeros
                                    .map((e) => TeoremaAritimetica(numero: e)
                                        .calcularDivisores(e))
                                    .toList();
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Dialog(
                                        child: SizedBox(
                                          height: 500,
                                          width: 500,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text("Resultados:",
                                                      style: GoogleFonts
                                                          .robotoMono(
                                                        fontSize: 20,
                                                        color: Colors.grey[800],
                                                      )),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: ListView.builder(
                                                  itemCount: divisores.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Text(
                                                          divisores[index],
                                                          style: GoogleFonts
                                                              .robotoMono(
                                                            fontSize: 20,
                                                            color: Colors
                                                                .grey[800],
                                                          )),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: const Text("Fechar"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

//métodos dos botões
  List<int>? converter(String numeros) {
    var listaNumeros = numeros.split(" ");
    var listaNumerosInt = listaNumeros.map((e) => int.tryParse(e)).toList();
    var listaFinal = <int>[];
    for (int? numero in listaNumerosInt) {
      if (numero != null && numero != 0) listaFinal.add(numero);
    }
    return listaFinal;
  }
}
