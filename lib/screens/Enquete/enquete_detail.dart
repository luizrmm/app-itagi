import 'package:aqui_cliente/screens/Enquete/enquete_res.dart';
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
            Expanded(
              flex: 2,
              child: RichText(
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
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      color: Color(0xFF61E47C),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EnqueteResultado()));
                      },
                      child: Text('A Favor',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      color: Color(0xFFD76E6E),
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
