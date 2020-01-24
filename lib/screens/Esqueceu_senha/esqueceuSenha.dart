import 'package:aqui_cliente/notifiers/esqueceu_notifier.dart';
import 'package:aqui_cliente/screens/Esqueceu_senha/confirmar_codigo.dart';
import 'package:aqui_cliente/screens/Perfil/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EsqueceuSenha extends StatefulWidget {
  @override
  _EsqueceuSenhaState createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> form;
    return Scaffold(
        appBar: AppBar(
          title: Text('Recuperar Senha'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstrainsts) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstrainsts.maxHeight),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/password.png',
                          height: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
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
                                controller: _email,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 10.0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide.none)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório';
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
                                        form = {'email': _email.text};
                                        await model.recuperarSenha(form);
                                        if (model.requestSucces) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConfirmarCodigo()));
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
        ));
  }
}
