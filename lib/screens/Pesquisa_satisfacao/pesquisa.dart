import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:flutter/material.dart';

class PesquisaSatisfacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa de Satisfação'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Saúde',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Insastifeito',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Pouco satisfeito',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Satisfeito',
                    )
                  ],
                )
              ],
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Educação',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Insastifeito',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Pouco satisfeito',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Satisfeito',
                    )
                  ],
                )
              ],
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Segurança',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Insastifeito',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Pouco satisfeito',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Satisfeito',
                    )
                  ],
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                child: DefaultButton(
                  text: 'Confirmar',
                  function: () {},
                ))
          ],
        ),
      ),
    );
  }
}
