import 'package:aqui_cliente/screens/Agenda_obras/widgets/obras_card.dart';
import 'package:flutter/material.dart';

class AgendaObras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda de Obras'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return ObrasCard();
            },
          )),
    );
  }
}
