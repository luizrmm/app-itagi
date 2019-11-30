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
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Insastifeito',
                      style: TextStyle(fontSize: 18.0),
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
                      style: TextStyle(fontSize: 18.0),
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
                      style: TextStyle(fontSize: 18.0),
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
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Insastifeito',
                      style: TextStyle(fontSize: 18.0),
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
                      style: TextStyle(fontSize: 18.0),
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
                      style: TextStyle(fontSize: 18.0),
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
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: true,
                      activeColor: Colors.black,
                    ),
                    Text(
                      'Insastifeito',
                      style: TextStyle(fontSize: 18.0),
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
                      style: TextStyle(fontSize: 18.0),
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
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.45,
                height: 42,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
