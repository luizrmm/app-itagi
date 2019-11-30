import 'package:aqui_cliente/screens/Telefones_uteis/widgets/telefone_row.dart';
import 'package:aqui_cliente/screens/Telefones_uteis/widgets/telefone_tile.dart';
import 'package:flutter/material.dart';

class TelefonesUteis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> nomes = [
      'Secretária da Educação',
      'Administração',
      'Secretária da Saúde'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Telefones Úteis'),
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
