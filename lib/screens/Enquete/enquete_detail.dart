import 'package:flutter/material.dart';

class EnqueteDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título da Enquete'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                'Pec 6/2019',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Situação: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Trasnformada na emenda constitucional ',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(text: '103/2019.'),
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
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
                      text:
                          'Modifica o sistema de previdência social, estabelece regras de transição e disposições transitórias, e dá outras providências.',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {},
                      child: Text('A Favor',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        'Contra',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
