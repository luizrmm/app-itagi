import 'package:aqui_cliente/screens/Cadastro/cadastro.dart';
import 'package:aqui_cliente/screens/Esqueceu_senha/esqueceuSenha.dart';
import 'package:aqui_cliente/screens/Fale_conosco/widgets/label.dart';
import 'package:aqui_cliente/screens/Termo/termo.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:aqui_cliente/state/user_store.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../Home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode senhaFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  @override
  void dispose() {
    senhaFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                          'assets/logo_barreiras.png',
                          height: 120,
                        ),
                      ),
                      Label(
                        value: 'Usuário',
                      ),
                      Input(
                        focusNode: emailFocusNode,
                        controller: _email,
                        isObscure: false,
                        action: TextInputAction.done,
                        type: TextInputType.emailAddress,
                        nextFocus: null,
                        validatorFunc: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório!';
                          }
                          return null;
                        },
                      ),
                      Label(
                        value: 'Senha',
                      ),
                      Input(
                        focusNode: senhaFocusNode,
                        controller: _password,
                        action: TextInputAction.done,
                        isObscure: true,
                        validatorFunc: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório!';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                        child: StateBuilder<UserStore>(
                          models: [Injector.getAsReactive<UserStore>()],
                          builder: (BuildContext context, reactiveModel) {
                            return MaterialButton(
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              onPressed: () {
                                reactiveModel.setState(
                                  (reactiveModel) => reactiveModel.authenticate(
                                      _email.text, _password.text),
                                  onData: (context, data) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  onError: (context, error) {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            error.response.data['mensagem']),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: reactiveModel.isWaiting
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white))
                                  : Text(
                                      'Entrar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            );
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EsqueceuSenha()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cadastro()));
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
          ),
        );
      },
    );
  }
}
