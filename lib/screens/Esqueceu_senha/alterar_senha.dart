import 'package:aqui_cliente/notifiers/esqueceu_notifier.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
import 'package:aqui_cliente/screens/Perfil/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlterarSenha extends StatefulWidget {
  @override
  _AlterarSenhaState createState() => _AlterarSenhaState();
}

class _AlterarSenhaState extends State<AlterarSenha> {
  final _novaSenha = TextEditingController();
  final _confirmarSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> form;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar senha'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.blueGrey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        'assets/novaSenha.png',
                        height: 160,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 18.0),
                          child: Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.emailAddress,
                              controller: _novaSenha,
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  hintText: 'Insira sua nova senha',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                            ),
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 18.0),
                          child: Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.emailAddress,
                              controller: _confirmarSenha,
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  hintText: 'Confirme sua senha ',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                              validator: (value) {
                                if (value != _novaSenha.text) {
                                  return 'As senha devem ser iguais';
                                }
                                return null;
                              },
                            ),
                          )),
                      Consumer<EsqueceuSenhaNotifier>(
                        builder: (context, model, child) {
                          return model.loading
                              ? Center(child: Loading())
                              : Button(
                                  text: 'ENVIAR',
                                  color: Theme.of(context).primaryColor,
                                  function: () async {
                                    if (_formKey.currentState.validate()) {
                                      form = {
                                        "usuario_app_id": model.retorno.id,
                                        "senha": _novaSenha.text,
                                        "confirmar_senha": _confirmarSenha.text
                                      };
                                      await model.trocarSenhaEsqueceu(form);
                                      if (model.requestSucces) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      } else {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(model.errorMessage),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                    }
                                  },
                                );
                        },
                      )
                    ],
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
