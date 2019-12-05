import 'package:flutter/material.dart';

import 'widgets/telefone_row.dart';
import 'widgets/telefone_tile.dart';

class Contatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> nomes = [
      'Secretária da Educação',
      'Administração',
      'Secretária da Saúde'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return TelefoneTile(
            title: nomes[index],
            telefones: <Widget>[
              TelefoneRow(
                telNumber: '(33) 3333-0000',
              ),
              TelefoneRow(
                telNumber: '(55) 5555-0000',
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
