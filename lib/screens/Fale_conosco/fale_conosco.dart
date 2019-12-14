import 'package:aqui_cliente/notifiers/faleConosco_notifier.dart';
import 'package:aqui_cliente/screens/Fale_conosco/widgets/label.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class FaleConosco extends StatefulWidget {
  @override
  _FaleConoscoState createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _telefone = MaskedTextController(mask: '(00)00000-0000');
  final _mensagem = TextEditingController();
  Map<String, dynamic> formulario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fale Conosco'),
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
                        children: <Widget>[
                          Label(
                            value: 'Nome',
                          ),
                          Input(
                            controller: _nome,
                            isObscure: false,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório!';
                              }
                              return null;
                            },
                          ),
                          Label(
                            value: 'Email',
                          ),
                          Input(
                            controller: _email,
                            isObscure: false,
                            type: TextInputType.emailAddress,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório!';
                              }
                              return null;
                            },
                          ),
                          Label(
                            value: 'Telefone',
                          ),
                          Input(
                            controller: _telefone,
                            isObscure: false,
                            type: TextInputType.phone,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório!';
                              }
                              return null;
                            },
                          ),
                          Label(
                            value: 'Mensagem',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              controller: _mensagem,
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10.0),
                                  hintText: 'Insira aqui sua mensagem',
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                              maxLines: 3,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                              child: DefaultButton(
                                  text: 'Confirmar',
                                  function: () async {
                                    if (_formKey.currentState.validate()) {
                                      formulario = {
                                        'nome': _nome.text,
                                        'email': _email.text,
                                        'telefone': _telefone.text,
                                        'mensagem': _mensagem.text
                                      };
                                      await Provider.of<FaleNotifier>(context)
                                          .sendMessage(formulario);
                                      if (Provider.of<FaleNotifier>(context)
                                          .requestSucces) {
                                        _nome.clear();
                                        _telefone.clear();
                                        _email.clear();
                                        _mensagem.clear();
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              Provider.of<FaleNotifier>(context)
                                                  .successMessage),
                                          backgroundColor: Colors.green,
                                        ));
                                      } else {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              Provider.of<FaleNotifier>(context)
                                                  .errorMessage),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                    }
                                  }))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
