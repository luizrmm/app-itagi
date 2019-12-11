import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/label.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _senha = TextEditingController();
  final _email = TextEditingController();
  final telefone = TextEditingController();
  final _endereco = TextEditingController();
  final _numero = TextEditingController();
  final _bairro = TextEditingController();
  final _cidadeId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
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
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Label(
                            value: 'Usuário',
                          ),
                          Input(
                            controller: _nome,
                            type: TextInputType.text,
                            isObscure: false,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Por favor insira seu nome';
                              }
                              return null;
                            },
                          ),
                          Label(
                            value: 'Senha',
                          ),
                          Input(
                            controller: _senha,
                            isObscure: true,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'A senha é obrigatória';
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
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return 'Insira um email valido';
                              }
                              return null;
                            },
                          ),
                          Label(
                            value: 'telefone',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter(
                                    RegExp("[a-zA-Z]")),
                                BlacklistingTextInputFormatter(
                                    RegExp("[abFeG]")),
                              ],
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Label(
                            value: 'Endereço',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Label(
                            value: 'Bairro',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Column(
                                  children: <Widget>[
                                    Label(
                                      value: 'Cidade',
                                    ),
                                    Material(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      elevation: 7.0,
                                      shadowColor: Colors.black,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 16),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12.0,
                                                    vertical: 10.0),
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Label(
                                      value: 'Número',
                                    ),
                                    Material(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      elevation: 7.0,
                                      shadowColor: Colors.black,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 16),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12.0,
                                                    vertical: 10.0),
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                            child: MaterialButton(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              height: 42,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  print('valido');
                                }
                              },
                              child: Text(
                                'Cadastrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
