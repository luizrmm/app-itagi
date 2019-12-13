import 'package:aqui_cliente/screens/Perfil/widgets/label.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Label(
                          value: 'Nome',
                        ),
                        TextFormField(
                          initialValue: 'Testando',
                          enabled: false,
                          decoration:
                              InputDecoration(disabledBorder: InputBorder.none),
                        ),
                        Label(
                          value: 'Email',
                        ),
                        TextFormField(
                          initialValue: 'Testando',
                          enabled: false,
                          decoration:
                              InputDecoration(disabledBorder: InputBorder.none),
                        ),
                        Label(
                          value: 'Telefone',
                        ),
                        TextFormField(
                          initialValue: 'Testando',
                          enabled: false,
                          decoration:
                              InputDecoration(disabledBorder: InputBorder.none),
                        ),
                        Label(
                          value: 'Endereço',
                        ),
                        TextFormField(
                          initialValue: 'Testando',
                          enabled: false,
                          decoration:
                              InputDecoration(disabledBorder: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
