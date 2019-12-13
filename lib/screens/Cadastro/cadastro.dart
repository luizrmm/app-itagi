import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/notifiers/cadastro_notifier.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
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
  FocusNode myFocusNode = FocusNode();
  FocusNode senhaFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode telefoneFocusNode = FocusNode();
  FocusNode enderecoFocusNode = FocusNode();
  FocusNode numeroFocusNode = FocusNode();
  FocusNode complementoFocusNode = FocusNode();
  FocusNode bairroFocusNode = FocusNode();
  FocusNode estadoFocusNode = FocusNode();
  FocusNode cidadeFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _senha = TextEditingController();
  final _email = TextEditingController();
  final _telefone = MaskedTextController(mask: '(00)00000-0000');
  final _endereco = TextEditingController();
  final _bairro = TextEditingController();
  final _complemento = TextEditingController();
  final _numero = TextEditingController();
  UserModel user = UserModel();

  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => Provider.of<CadastroNotifier>(context).getCidades('MG'));
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    senhaFocusNode.dispose();

    super.dispose();
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
                child: SafeArea(child: Consumer<CadastroNotifier>(
                  builder: (context, result, child) {
                    return Container(
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
                              nextFocus: senhaFocusNode,
                              action: TextInputAction.next,
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
                              focusNode: senhaFocusNode,
                              nextFocus: emailFocusNode,
                              action: TextInputAction.next,
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
                              focusNode: emailFocusNode,
                              nextFocus: telefoneFocusNode,
                              action: TextInputAction.next,
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
                              focusNode: telefoneFocusNode,
                              nextFocus: enderecoFocusNode,
                              action: TextInputAction.next,
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
                                        focusNode: enderecoFocusNode,
                                        nextFocus: numeroFocusNode,
                                        action: TextInputAction.next,
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
                                        focusNode: numeroFocusNode,
                                        nextFocus: complementoFocusNode,
                                        action: TextInputAction.next,
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
                              focusNode: complementoFocusNode,
                              nextFocus: bairroFocusNode,
                              action: TextInputAction.next,
                              controller: _complemento,
                              isObscure: false,
                            ),
                            Label(
                              value: 'Bairro',
                            ),
                            Input(
                              focusNode: bairroFocusNode,
                              nextFocus: estadoFocusNode,
                              action: TextInputAction.done,
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
                                        focusNode: estadoFocusNode,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        isExpanded: true,
                                        items: result.estados.map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          result.changeValue(newValue);
                                          FocusScope.of(context)
                                              .requestFocus(cidadeFocusNode);
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
                                      result.loadingcity ||
                                              result.cidades == null
                                          ? Loading()
                                          : DropdownButton(
                                              focusNode: cidadeFocusNode,
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              value: result.city,
                                              isExpanded: true,
                                              items:
                                                  result.cidades.map((value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.id,
                                                  child: Text(value.nome),
                                                );
                                              }).toList(),
                                              onChanged: (String newValue) {
                                                result.changeCidade(newValue);
                                              },
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            result.loading
                                ? Center(child: Loading())
                                : Padding(
                                    padding: EdgeInsets.only(
                                        top: 18.0, bottom: 20.0),
                                    child: DefaultButton(
                                      text: 'Cadastrar',
                                      function: () async {
                                        if (_formKey.currentState.validate()) {
                                          user.nome = _nome.text;
                                          user.email = _email.text;
                                          user.telefone = _telefone.text;
                                          user.endereco = _endereco.text;
                                          user.numero = _numero.text;
                                          user.bairro = _bairro.text;
                                          user.complemento = _complemento.text;
                                          user.cidadeId = result.city;

                                          await result.cadastrar(
                                              user, _senha.text);
                                          if (result.requestSucces) {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text(result.successMessage),
                                              backgroundColor: Colors.green,
                                            ));
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          } else {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text(result.errorMessage),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                        }
                                      },
                                    )),
                          ],
                        ),
                      ),
                    );
                  },
                ))),
          );
        },
      ),
    );
  }
}
