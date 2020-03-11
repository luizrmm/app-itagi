import 'package:aqui_cliente/notifiers/user_notifier.dart';
import 'package:aqui_cliente/screens/Cadastro/cadastro.dart';
import 'package:aqui_cliente/screens/Esqueceu_senha/esqueceuSenha.dart';
import 'package:aqui_cliente/screens/Fale_conosco/widgets/label.dart';
import 'package:aqui_cliente/screens/Termo/termo.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:aqui_cliente/view-models/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = new LoginViewModel();
  FocusNode senhaFocusNode = FocusNode();

  @override
  void dispose() {
    senhaFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.9),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[700]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 120,
                  ),
                ),
                Label(
                  value: 'Usuário',
                ),
                Input(
                  action: TextInputAction.next,
                  type: TextInputType.emailAddress,
                  submitedFunc: (value) {
                    FocusScope.of(context).requestFocus(senhaFocusNode);
                  },
                  validatorFunc: (value) {
                    if (value.isEmpty) {
                      return 'Informe seu email';
                    }
                    return null;
                  },
                  saveFunc: (value) {
                    model.email = value;
                  },
                ),
                Label(
                  value: 'Senha',
                ),
                Input(
                  focusNode: senhaFocusNode,
                  isObscure: true,
                  validatorFunc: (value) {
                    if (value.isEmpty) {
                      return 'Informe sua senha';
                    }
                    return null;
                  },
                  saveFunc: (value) {
                    model.password = value;
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                    child: Consumer<UserNotifier>(
                      builder: (context, user, child) {
                        return DefaultButton(
                          text: 'Entrar',
                          isbusy: user.loading,
                          function: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              await user.authenticate(model);
                              if (user.requestSucces) {
                                _formKey.currentState.reset();
                                user.getUserToken();
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(user.errorMessage),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                        );
                      },
                    )),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EsqueceuSenha(),
                      ),
                    );
                  },
                  child: Text(
                    'Esqueceu sua senha?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: FlatButton(
                    child: RichText(
                      text: TextSpan(
                        text: 'Não tem conta? ',
                        style: TextStyle(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Cadastre-se',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cadastro()));
                    },
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Termo e Política de Privacidade de Uso',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Termo()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
