import 'package:aqui_cliente/notifiers/cadastro_notifier.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

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
  final _telefone = MaskedTextController(mask: '(00)00000-0000');
  final _endereco = TextEditingController();
  final _bairro = TextEditingController();
  final _complemento = TextEditingController();
  final _numero = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<CadastroNotifier>(context).getCidades('MG'));
  }

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
                          Input(
                            controller: _telefone,
                            isObscure: false,
                            type: TextInputType.phone,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Por favor insira um número de telefone';
                              }
                              return null;
                            },
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
                                    Input(
                                      isObscure: false,
                                      controller: _endereco,
                                      validatorFunc: (value) {
                                        if (value.isEmpty) {
                                          return 'Por favor insira um endereço válido';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Label(
                                      value: 'Número',
                                    ),
                                    Input(
                                      type: TextInputType.number,
                                      isObscure: false,
                                      controller: _numero,
                                      validatorFunc: (value) {
                                        if (value.isEmpty) {
                                          return 'Campo obrigatório';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Label(
                            value: 'Complemento',
                          ),
                          Input(
                            controller: _complemento,
                            isObscure: false,
                          ),
                          Label(
                            value: 'Bairro',
                          ),
                          Input(
                            controller: _bairro,
                            isObscure: false,
                            validatorFunc: (value) {
                              if (value.isEmpty) {
                                return 'Por favor informe seu bairro';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Label(
                                      value: 'Estado',
                                    ),
                                    DropdownButton(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      items:
                                          Provider.of<CadastroNotifier>(context)
                                              .estados
                                              .map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        Provider.of<CadastroNotifier>(context)
                                            .changeValue(newValue);
                                      },
                                      value:
                                          Provider.of<CadastroNotifier>(context)
                                              .estado,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                flex: 3,
                                child: Column(
                                  children: <Widget>[
                                    Label(
                                      value: 'Cidade',
                                    ),
                                    Provider.of<CadastroNotifier>(context)
                                                .loading ||
                                            Provider.of<CadastroNotifier>(
                                                        context)
                                                    .cidades ==
                                                null
                                        ? Loading()
                                        : DropdownButton(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            value:
                                                Provider.of<CadastroNotifier>(
                                                        context)
                                                    .city,
                                            isExpanded: true,
                                            items:
                                                Provider.of<CadastroNotifier>(
                                                        context)
                                                    .cidades
                                                    .map((value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id,
                                                child: Text(value.nome),
                                              );
                                            }).toList(),
                                            onChanged: (String newValue) {
                                              Provider.of<CadastroNotifier>(
                                                      context)
                                                  .changeCidade(newValue);
                                            },
                                          )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                              child: DefaultButton(
                                text: 'Cadastrar',
                                function: () {
                                  if (_formKey.currentState.validate()) {
                                    print('oi');
                                  } else {
                                    print('tchau');
                                  }
                                },
                              )),
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
