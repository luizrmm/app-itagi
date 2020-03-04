import 'package:aqui_cliente/notifiers/user_notifier.dart';
import 'package:aqui_cliente/screens/Alterar_senha/alterarSenhaPerfil.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
import 'package:aqui_cliente/screens/Perfil/widgets/label.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:aqui_cliente/utils/constants.dart';
import 'package:aqui_cliente/utils/utils.dart';
import 'package:aqui_cliente/view-models/perfil_viewmodel.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'widgets/button.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  PerfilViewModel model = new PerfilViewModel();
  Utils preferences = new Utils();
  bool isEditable = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode senhaFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode telefoneFocusNode = FocusNode();
  FocusNode enderecoFocusNode = FocusNode();
  FocusNode numeroFocusNode = FocusNode();
  FocusNode complementoFocusNode = FocusNode();
  FocusNode bairroFocusNode = FocusNode();
  FocusNode estadoFocusNode = FocusNode();
  FocusNode cidadeFocusNode = FocusNode();
  Map<String, dynamic> formulario;
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<UserNotifier>(context, listen: false).getUser());
  }

  @override
  void dispose() {
    senhaFocusNode.dispose();
    emailFocusNode.dispose();
    telefoneFocusNode.dispose();
    enderecoFocusNode.dispose();
    numeroFocusNode.dispose();
    complementoFocusNode.dispose();
    bairroFocusNode.dispose();
    estadoFocusNode.dispose();
    cidadeFocusNode.dispose();
    super.dispose();
  }

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
                child: Consumer<UserNotifier>(
                  builder: (context, userModel, child) {
                    if (userModel.loading) {
                      return Center(
                        child: Loading(),
                      );
                    } else {
                      model.nome = userModel.user.nome;
                      model.email = userModel.user.email;
                      model.telefone = userModel.user.telefone;
                      model.endereco = userModel.user.endereco;
                      model.numero = userModel.user.numero;
                      model.bairro = userModel.user.bairro;
                      model.complemento = userModel.user.complemento;
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
                                initialValue: model.nome,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(emailFocusNode);
                                },
                                enabled: isEditable,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório!';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  model.nome = value;
                                },
                              ),
                              Label(
                                value: 'Email',
                              ),
                              TextFormField(
                                initialValue: model.email,
                                enabled: isEditable,
                                focusNode: emailFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(telefoneFocusNode);
                                },
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'Insira um email valido';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  model.email = value;
                                },
                              ),
                              Label(
                                value: 'Telefone',
                              ),
                              TextFormField(
                                initialValue: model.telefone,
                                enabled: isEditable,
                                focusNode: telefoneFocusNode,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter(digito_9: true)
                                ],
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(enderecoFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório!';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
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
                                        TextFormField(
                                          initialValue: model.endereco,
                                          enabled: isEditable,
                                          focusNode: enderecoFocusNode,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (String value) {
                                            FocusScope.of(context)
                                                .requestFocus(numeroFocusNode);
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Campo obrigatório!';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            model.endereco = value;
                                          },
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
                                          initialValue: model.numero,
                                          enabled: isEditable,
                                          focusNode: numeroFocusNode,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (String value) {
                                            FocusScope.of(context).requestFocus(
                                                complementoFocusNode);
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Campo obrigatório!';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
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
                              TextFormField(
                                initialValue: model.complemento,
                                enabled: isEditable,
                                focusNode: complementoFocusNode,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(bairroFocusNode);
                                },
                                onSaved: (value) {
                                  model.complemento = value;
                                },
                              ),
                              Label(
                                value: 'Bairro',
                              ),
                              TextFormField(
                                initialValue: model.bairro,
                                enabled: isEditable,
                                focusNode: bairroFocusNode,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(estadoFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório!';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  model.bairro = value;
                                },
                              ),
                              isEditable
                                  ? Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Column(
                                            children: <Widget>[
                                              Label(
                                                value: 'Estado',
                                              ),
                                              DropdownButton(
                                                focusNode: estadoFocusNode,
                                                icon: Icon(
                                                    Icons.keyboard_arrow_down),
                                                isExpanded: true,
                                                items: estados.map((value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  userModel
                                                      .changeValue(newValue);
                                                  model.estado = newValue;
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          cidadeFocusNode);
                                                },
                                                value: userModel.estado,
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
                                              userModel.loadingCity ||
                                                      userModel.cidades == null
                                                  ? Text('Aguardando Estado')
                                                  : DropdownButton(
                                                      hint: Text(
                                                          'Selecione uma ciadade'),
                                                      focusNode:
                                                          cidadeFocusNode,
                                                      icon: Icon(Icons
                                                          .keyboard_arrow_down),
                                                      value: userModel.city,
                                                      isExpanded: true,
                                                      items: userModel.cidades
                                                          .map((value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value.id,
                                                          child:
                                                              Text(value.nome),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String value) {
                                                        userModel.changeCidade(
                                                            value);
                                                        model.cidadeId = value;
                                                      },
                                                    )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Column(
                                            children: <Widget>[
                                              Label(
                                                value: 'Estado',
                                              ),
                                              TextFormField(
                                                initialValue:
                                                    userModel.user.estado,
                                                enabled: isEditable,
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
                                                initialValue:
                                                    userModel.user.cidade,
                                                enabled: isEditable,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                              isEditable
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 40.0),
                                      child: Button(
                                        color: Colors.green,
                                        text: userModel.loading
                                            ? 'Aguarde salvando ...'
                                            : 'Salvar',
                                        function: () async {
                                          setState(() {
                                            isEditable = false;
                                          });
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            await userModel.editPerfil(model);
                                            if (userModel.requestSucces) {
                                              await userModel.getUser();
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      userModel.successMessage),
                                                  backgroundColor: Colors.green,
                                                ),
                                              );
                                            } else {
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      userModel.errorMessage),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          top: 40.0, bottom: 12.0),
                                      child: Button(
                                        color: Colors.green,
                                        text: 'Editar perfil',
                                        function: () {
                                          setState(() {
                                            isEditable = !isEditable;
                                          });
                                        },
                                      ),
                                    ),
                              Button(
                                color: Theme.of(context).primaryColor,
                                text: 'Alterar senha',
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AlterarSenhaPerfil(),
                                    ),
                                  );
                                },
                              ),
                              isEditable
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: 12.0, bottom: 20.0),
                                      child: Button(
                                        color: Colors.red,
                                        text: 'Cancelar',
                                        function: () {
                                          setState(() {
                                            isEditable = false;
                                          });
                                        },
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          top: 12.0, bottom: 20.0),
                                      child: Button(
                                        color: Colors.red,
                                        text: 'Sair',
                                        function: () async {
                                          userModel.clearToken();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
