import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/notifiers/cadastro_notifier.dart';
import 'package:aqui_cliente/notifiers/perfil_notifier.dart';
import 'package:aqui_cliente/screens/Alterar_senha/alterarSenhaPerfil.dart';
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
    Future.microtask(() => Provider.of<PerfilNotifier>(context).getPerfil());
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
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(emailFocusNode);
                              },
                              enabled: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório!';
                                }
                                return null;
                              },
                            ),
                            Label(
                              value: 'Email',
                            ),
                            TextFormField(
                              controller: _email,
                              focusNode: emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(telefoneFocusNode);
                              },
                              enabled: result.isEditable,
                              validator: (value) {
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
                              value: 'Telefone',
                            ),
                            TextFormField(
                              controller: _telefone,
                              focusNode: telefoneFocusNode,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(enderecoFocusNode);
                              },
                              enabled: result.isEditable,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório!';
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
                                      TextFormField(
                                        controller: _endereco,
                                        focusNode: enderecoFocusNode,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (String value) {
                                          FocusScope.of(context)
                                              .requestFocus(numeroFocusNode);
                                        },
                                        enabled: result.isEditable,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Campo obrigatório!';
                                          }
                                          return null;
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
                                        controller: _numero,
                                        focusNode: numeroFocusNode,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (String value) {
                                          FocusScope.of(context).requestFocus(
                                              complementoFocusNode);
                                        },
                                        enabled: result.isEditable,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Campo obrigatório!';
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
                            TextFormField(
                              controller: _complemento,
                              focusNode: complementoFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(bairroFocusNode);
                              },
                              enabled: result.isEditable,
                            ),
                            Label(
                              value: 'Bairro',
                            ),
                            TextFormField(
                              controller: _bairro,
                              focusNode: bairroFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(estadoFocusNode);
                              },
                              enabled: result.isEditable,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório!';
                                }
                                return null;
                              },
                            ),
                            result.isEditable
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
                                              items:
                                                  Provider.of<CadastroNotifier>(
                                                          context)
                                                      .estados
                                                      .map((value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                Provider.of<CadastroNotifier>(
                                                        context)
                                                    .changeValue(newValue);
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        cidadeFocusNode);
                                              },
                                              value:
                                                  Provider.of<CadastroNotifier>(
                                                          context)
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
                                            Provider.of<CadastroNotifier>(
                                                            context)
                                                        .loadingcity ||
                                                    Provider.of<CadastroNotifier>(
                                                                context)
                                                            .cidades ==
                                                        null
                                                ? Text('Aguardando Estado')
                                                : DropdownButton(
                                                    hint: Text(
                                                        'Selecione uma ciadade'),
                                                    focusNode: cidadeFocusNode,
                                                    icon: Icon(Icons
                                                        .keyboard_arrow_down),
                                                    value: Provider.of<
                                                                CadastroNotifier>(
                                                            context)
                                                        .city,
                                                    isExpanded: true,
                                                    items: Provider.of<
                                                                CadastroNotifier>(
                                                            context)
                                                        .cidades
                                                        .map((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value.id,
                                                        child: Text(value.nome),
                                                      );
                                                    }).toList(),
                                                    onChanged:
                                                        (String newValue) {
                                                      Provider.of<CadastroNotifier>(
                                                              context)
                                                          .changeCidade(
                                                              newValue);
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
                                      text: result.loading
                                          ? 'Aguarde salvando ...'
                                          : 'Salvar',
                                      function: () async {
                                        result.enableEdit(false);
                                        if (_formKey.currentState.validate()) {
                                          formulario = {
                                            "email": _email.text,
                                            "telefone": _telefone.text,
                                            "endereco": _endereco.text,
                                            "numero": _numero.text,
                                            "bairro": _bairro.text,
                                            "complemento": _complemento.text,
                                            "cidade_id": Provider.of<
                                                                CadastroNotifier>(
                                                            context)
                                                        .city ==
                                                    null
                                                ? user.cidadeId
                                                : Provider.of<CadastroNotifier>(
                                                        context)
                                                    .city
                                          };
                                          await Provider.of<PerfilNotifier>(
                                                  context)
                                              .editarPerfil(formulario);
                                          if (Provider.of<PerfilNotifier>(
                                                  context)
                                              .requestSucces) {
                                            await Provider.of<PerfilNotifier>(
                                                    context)
                                                .getPerfil();
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  Provider.of<PerfilNotifier>(
                                                          context)
                                                      .successMessage),
                                              backgroundColor: Colors.green,
                                            ));
                                          } else {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  Provider.of<PerfilNotifier>(
                                                          context)
                                                      .errorMessage),
                                              backgroundColor: Colors.red,
                                            ));
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
                                      function: () {},
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
                                            AlterarSenhaPerfil()));
                              },
                            ),
                            result.isEditable
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: 12.0, bottom: 20.0),
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
                                        top: 12.0, bottom: 20.0),
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
