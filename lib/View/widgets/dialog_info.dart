import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogInfo extends StatelessWidget {
  const DialogInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(
          "Informaçes:",
          style: GoogleFonts.robotoMono(
            fontSize: 20,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'DESENVOLVIDO POR RAFAEL BASTOS',
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ESTUDANTE DE CIÊNCIAS DA COMPUTAÇÃO.',
                textAlign: TextAlign.center),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Fechar"),
          )
        ]);
  }
}
