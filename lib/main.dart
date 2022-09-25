import 'package:flutter/material.dart';
import 'package:numeros/View/conversor_base_view.dart';
import 'package:numeros/View/equacoes_diofantinas.dart';
import 'package:numeros/View/home_page.dart';
import 'package:numeros/View/identidade_bezout_view.dart';
import 'package:numeros/View/mmc_mdc_view.dart';
import 'package:numeros/View/resto_divisao_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        "/": (_) => const HomePage(),
        "/conversor_base": (_) => const ConversorBasePage(),
        "/identidade_bezout": (_) => const TeoremaBezoutPage(),
        "/mmc_mdc": (_) => const MmcMdcPage(),
        "/resto_divisao": (_) => const RestoDivisaoPage(),
        "/equacoes_diofantinas": (_) => const EquacoesDiofantinasPage()
      },
    );
  }
}
