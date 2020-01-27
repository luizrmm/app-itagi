import 'package:aqui_cliente/notifiers/esqueceu_notifier.dart';
import 'package:aqui_cliente/screens/Esqueceu_senha/alterar_senha.dart';
import 'package:aqui_cliente/screens/Perfil/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmarCodigo extends StatefulWidget {
  @override
  _ConfirmarCodigoState createState() => _ConfirmarCodigoState();
}

class _ConfirmarCodigoState extends State<ConfirmarCodigo> {
  final _codigo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> form;
    return Scaffold(
        appBar: AppBar(
          title: Text('Confirmar código'),
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
                          'assets/senha.png',
                          height: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Por favor insira o código que enviamos no seu email\n O código expira em 2 horas',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 18.0),
                          child: Input(
                            action: TextInputAction.done,
                            controller: _codigo,
                            focusNode: null,
                            isObscure: false,
                            nextFocus: null,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                          ),
                        ),
                        Consumer<EsqueceuSenhaNotifier>(
                          builder: (context, model, child) {
                            return model.loading
                                ? Center(
                                    child: Loading(),
                                  )
                                : Button(
                                    text: 'ENVIAR',
                                    color: Theme.of(context).primaryColor,
                                    function: () async {
                                      if (_formKey.currentState.validate()) {
                                        form = {
                                          "usuario_app_id": model.retorno.id,
                                          "codigo": _codigo.text
                                        };
                                        await model.enviarCodigo(form);
                                        if (model.requestSucces) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AlterarSenha()));
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
