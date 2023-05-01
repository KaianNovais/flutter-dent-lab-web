import 'package:flutter/material.dart';
import 'package:flutter_dent_lab/app_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoletoList extends StatelessWidget {
  const BoletoList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Row(children: [
        const Icon(FontAwesomeIcons.dollarSign, color: Colors.deepPurple),
        const SizedBox(width:8),
        Text("Boletos à vencer", style: textoBotao())
      ])),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sem boletos", style: textoBotao()),
            Image.asset("images/hearts.png", width: 72, height: 72),
            Image.asset("images/clapping.png", width: 72, height: 72),
            
          ],
        ),
      ),
    );
  }
}