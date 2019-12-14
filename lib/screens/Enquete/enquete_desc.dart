import 'package:flutter/material.dart';

class EnqueteDesc extends StatelessWidget {
  final String contra;
  final String favor;
  final String title;
  final String description;

  const EnqueteDesc(
      {Key key, this.contra, this.favor, this.title, this.description})
      : super(key: key);
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
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Ementa: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: description,
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 18.0),
              child: Text(
                'Resultado Final',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '$favor\nA Favor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF61E47C),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$contra\nContra',
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
