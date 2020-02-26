import 'package:aqui_cliente/notifiers/cadastro_notifier.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:aqui_cliente/utils/constants.dart';
import 'package:aqui_cliente/view-models/cadastro_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'widgets/label.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  CadastroViewModel model = new CadastroViewModel();

  final _formKey = GlobalKey<FormState>();

  FocusNode senhaFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode telefoneFocusNode = FocusNode();
  FocusNode enderecoFocusNode = FocusNode();
  FocusNode numeroFocusNode = FocusNode();
  FocusNode complementoFocusNode = FocusNode();
  FocusNode bairroFocusNode = FocusNode();
  FocusNode estadoFocusNode = FocusNode();

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    senhaFocusNode.dispose();
    emailFocusNode.dispose();
    telefoneFocusNode.dispose();
    enderecoFocusNode.dispose();
    numeroFocusNode.dispose();
    complementoFocusNode.dispose();
    bairroFocusNode.dispose();
    estadoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:  Container(
                constraints: BoxConstraints(minHeight: screenHeight),
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
                        action: TextInputAction.next,
                        submitedFunc: (_) {
                          FocusScope.of(context).requestFocus(senhaFocusNode);
                        },
                        validatorFunc: (value) {
                          if (value.isEmpty) {
                            return 'Informe seu nome completo';
                          }
                          return null;
                        },
                        saveFunc: (value) {
                          model.nome = value;
                        },
                      ),
                      Label(
                        value: 'Senha',
                      ),
                      Input(
                        focusNode: senhaFocusNode,
                        isObscure: true,
                        submitedFunc: (_) {
                          FocusScope.of(context).requestFocus(emailFocusNode);
                        },
                        validatorFunc: (value) {
                          if (value.isEmpty) {
                            return 'Informe sua senha';
                          }
                          return null;
                        },
                        saveFunc: (value) {
                          model.senha = value;
                        },
                      ),
                      Label(
                        value: 'Email',
                      ),
                      Input(
                        focusNode: emailFocusNode,
                        action: TextInputAction.next,
                        type: TextInputType.emailAddress,
                        submitedFunc: (_) {
                          FocusScope.of(context)
                              .requestFocus(telefoneFocusNode);
                        },
                        validatorFunc: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Insira um email valido';
                          }
                          return null;
                        },
                        saveFunc: (value) {
                          model.email = value;
                        },
                      ),
                      Label(
                        value: 'Telefone',
                      ),
                      Input(
                        focusNode: telefoneFocusNode,
                        action: TextInputAction.next,
                        type: TextInputType.phone,
                        submitedFunc: (_) {
                          FocusScope.of(context)
                              .requestFocus(enderecoFocusNode);
                        },
                        validatorFunc: (value) {
                          if (value.isEmpty) {
                            return 'Por favor insira um número de telefone';
                          }
                          return null;
                        },
                        saveFunc: (value) {
                          model.telefone = value;
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
                                  focusNode: enderecoFocusNode,
                                  action: TextInputAction.next,
                                  submitedFunc: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(numeroFocusNode);
                                  },
                                  validatorFunc: (value) {
                                    if (value.isEmpty) {
                                      return 'Por favor insira um endereço válido';
                                    }
                                    return null;
                                  },
                                  saveFunc: (value) {
                                    model.endereco = value;
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
                                  focusNode: numeroFocusNode,
                                  action: TextInputAction.next,
                                  type: TextInputType.number,
                                  submitedFunc: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(complementoFocusNode);
                                  },
                                  validatorFunc: (value) {
                                    if (value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                  saveFunc: (value) {
                                    model.numero = value;
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
                        focusNode: complementoFocusNode,
                        action: TextInputAction.next,
                        submitedFunc: (_) {
                          FocusScope.of(context).requestFocus(bairroFocusNode);
                        },
                        saveFunc: (value) {
                          model.complemento = value;
                        },
                      ),
                      Label(
                        value: 'Bairro',
                      ),
                      Input(
                        focusNode: bairroFocusNode,
                        submitedFunc: (_) {
                          FocusScope.of(context).requestFocus(estadoFocusNode);
                        },
                        validatorFunc: (value) {
                          if (value.isEmpty) {
                            return 'Por favor informe seu bairro';
                          }
                          return null;
                        },
                        saveFunc: (value) {
                          model.bairro = value;
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
                                  focusNode: estadoFocusNode,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: estados.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    bairroFocusNode.unfocus();
                                    result.changeValue(newValue);
                                  },
                                  value: result.estado,
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
                                result.loadingcity || result.cidades == null
                                    ? Loading()
                                    : DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: result.city,
                                        isExpanded: true,
                                        items: result.cidades.map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value.id,
                                            child: Text(value.nome),
                                          );
                                        }).toList(),
                                        onChanged: (String newValue) {
                                          model.cidadeId = newValue;
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
                          isbusy: result.loading,
                          text: 'Cadastrar',
                          function: () async {
                            if (_formKey.currentState.validate()) {
                              await result.cadastrar();
                              if (result.requestSucces) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(result.successMessage),
                                  backgroundColor: Colors.green,
                                ));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(result.errorMessage),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          
        ),
      ),
    );
  }
}
