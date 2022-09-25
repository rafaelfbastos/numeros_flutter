import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeros/View/widgets/dialog_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEORIA DOS NÚMEROS"),
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const DialogInfo();
                    });
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pushNamed("/conversor_base"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "CONVERSOR DE BASE:",
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CONVERTE NÚMEORS INTEIROS DE UMA BASE NÚMERICA PARA OUTRA. BASES ACEITAS:\n[ 2 , 3, 4, 5, 6, 7, 8, 9, 10, HEXADECIMAL]",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed("/identidade_bezout"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "IDENTIDADE DE BÉZOUT:",
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CALCULA OS COEFICIENTES DE BÉZOUT ENTRE DOIS NUMÉROS INTEIROS E DIFERENTE DE 0:",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed("/mmc_mdc"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "MMC E MDC:",
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CALCULA O MMC E O MDC ENTRE DOIS OU MAIS NÚMEROS INTEIROS E MOSTRA A DECOMPOSIÇÃO DESSES NÚMEROS EM SEUS FATORES PRIMOS, SEUS DIVISORES E A QUANTIDADE DE DIVISORES POSITIVOS: (OBS. DIGITE NÚMEROS INTEIROS SEPARADOS POR ESPAÇOS):",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed("/resto_divisao"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "RESTO DA DIVISÃO:",
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CALCULA O RESTO DA DIVISÃO ENTRE DOIS NÚMEROS INTEIROS, ONDE O DIVISOR DEVE SER DIFERENTE DE 0:",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed("/equacoes_diofantinas"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "EQUAÇÕES DIOFANTINAS LINEARES: ",
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CALCULA, SE POSSÍVEL, AS SOLUÇOES DE UMA EQUAÇÃO DIOFANTINA LINEAR DO TIPO AX + BY = C",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
