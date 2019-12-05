import 'package:flutter/material.dart';

class TelefonesUteis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telefones Úteis'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Saúde',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Hospital - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Scretária de Saúde - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Posto de Saúde - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Hospital Centro - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 1.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Transporte',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Táxi - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Ônibus - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Transporte de mudanças - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Hospital Centro - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 1.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Posto Policial',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Bairro Colina - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Bairro Vila Nova - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Bairro Járdim Itália - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Centro - '),
                      Text(
                        '(33) 3333-0000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
