import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/notifiers/perfil_notifier.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
import 'package:aqui_cliente/screens/Perfil/widgets/label.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

import 'widgets/button.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _estado = TextEditingController();
  final _cidade = TextEditingController();
  final _email = TextEditingController();
  final _telefone = MaskedTextController(mask: '(00)00000-0000');
  final _endereco = TextEditingController();
  final _bairro = TextEditingController();
  final _complemento = TextEditingController();
  final _numero = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<PerfilNotifier>(context).getPerfil());
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<PerfilNotifier>(context).userPerfil;
    if (Provider.of<PerfilNotifier>(context).userPerfil != null) {
      _nome.text = user.nome;
      _email.text = user.email;
      _telefone.text = user.telefone;
      _endereco.text = user.endereco;
      _numero.text = user.numero;
      _complemento.text = user.complemento;
      _bairro.text = user.bairro;
      _estado.text = user.estado;
      _cidade.text = user.cidade;
    }
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
              child: SafeArea(child: Consumer<PerfilNotifier>(
                builder: (context, result, child) {
                  if (result.loading || result.userPerfil == null) {
                    return Center(
                      child: Loading(),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Label(
                              value: 'Nome',
                            ),
                            TextFormField(
                              controller: _nome,
                              enabled: result.isEditable,
                            ),
                            Label(
                              value: 'Email',
                            ),
                            TextFormField(
                              controller: _email,
                              enabled: result.isEditable,
                            ),
                            Label(
                              value: 'Telefone',
                            ),
                            TextFormField(
                              controller: _telefone,
                              enabled: result.isEditable,
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      Label(
                                        value: 'Endereço',
                                      ),
                                      TextFormField(
                                        controller: _endereco,
                                        enabled: result.isEditable,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Label(
                                        value: 'Número',
                                      ),
                                      TextFormField(
                                        controller: _numero,
                                        enabled: result.isEditable,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Label(
                              value: 'Complemento',
                            ),
                            TextFormField(
                              controller: _complemento,
                              enabled: result.isEditable,
                            ),
                            Label(
                              value: 'Bairro',
                            ),
                            TextFormField(
                              controller: _bairro,
                              enabled: result.isEditable,
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Label(
                                        value: 'Estado',
                                      ),
                                      TextFormField(
                                        controller: _estado,
                                        enabled: result.isEditable,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                Flexible(
                                  flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      Label(
                                        value: 'Cidade',
                                      ),
                                      TextFormField(
                                        controller: _cidade,
                                        enabled: result.isEditable,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            result.isEditable
                                ? Padding(
                                    padding: EdgeInsets.only(top: 40.0),
                                    child: Button(
                                      color: Colors.green,
                                      text: 'Salvar',
                                      function: () {
                                        result.enableEdit(false);
                                      },
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(top: 40.0),
                                    child: Button(
                                      color: Colors.green,
                                      text: 'Editar perfil',
                                      function: () {
                                        result.enableEdit(true);
                                      },
                                    ),
                                  ),
                            result.isEditable
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: 18.0, bottom: 20.0),
                                    child: Button(
                                      color: Colors.red,
                                      text: 'Cancelar',
                                      function: () {
                                        result.enableEdit(false);
                                      },
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                        top: 18.0, bottom: 20.0),
                                    child: Button(
                                      color: Colors.red,
                                      text: 'Sair',
                                      function: () async {
                                        await result.deleteToken();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ),
                    );
                  }
                },
              )),
            ),
          );
        },
      ),
    );
  }
}
