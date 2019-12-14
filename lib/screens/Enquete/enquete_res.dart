import 'package:aqui_cliente/notifiers/enquetes/novas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnqueteResultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado da Enquete'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Seu voto foi enviado\n com sucesso!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Seu voto:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'assets/like.png',
              height: 90,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 18.0),
              child: Text(
                'Resultado Parcial',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '${Provider.of<NovasEnqueteNotifier>(context).favor}\nA Favor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF61E47C),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${Provider.of<NovasEnqueteNotifier>(context).contra}\nContra',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFD76E6E),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
