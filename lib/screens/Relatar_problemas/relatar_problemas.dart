import 'dart:convert';
import 'dart:io';

import 'package:aqui_cliente/notifiers/relatar_notifier.dart';
import 'package:aqui_cliente/screens/Fale_conosco/widgets/label.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RelProblemsScreen extends StatefulWidget {
  @override
  _RelProblemsScreenState createState() => _RelProblemsScreenState();
}

class _RelProblemsScreenState extends State<RelProblemsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _problema = TextEditingController();
  final _endereco = TextEditingController();
  final _descricao = TextEditingController();
  FocusNode enderecoFocusNode = FocusNode();
  FocusNode descricaoFocusNode = FocusNode();
  Map<String, dynamic> formulario;
  String base64Image;

  @override
  void dispose() {
    enderecoFocusNode.dispose();
    descricaoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    File _image = Provider.of<RelatarNotifier>(context).image;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          elevation: 7.0,
                          shadowColor: Colors.black,
                          child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: _image == null
                                  ? Image.asset(
                                      'assets/upload.png',
                                      height: 150,
                                    )
                                  : Image.file(_image))),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                        child: DefaultButton(
                          isbusy: false,
                          function: () {
                            Provider.of<RelatarNotifier>(context).getImage(0);
                          },
                          text: 'Tirar foto',
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: DefaultButton(
                          isbusy: false,
                          function: () {
                            Provider.of<RelatarNotifier>(context).getImage(1);
                          },
                          text: 'Carregar foto',
                        )),
                    Label(
                      value: 'Problema',
                    ),
                    Input(
                      controller: _problema,
                      nextFocus: enderecoFocusNode,
                      isObscure: false,
                      action: TextInputAction.next,
                      validatorFunc: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatório!';
                        }
                        return null;
                      },
                    ),
                    Label(
                      value: 'Endereço',
                    ),
                    Input(
                      controller: _endereco,
                      focusNode: enderecoFocusNode,
                      nextFocus: descricaoFocusNode,
                      isObscure: false,
                      action: TextInputAction.next,
                      validatorFunc: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatório!';
                        }
                        return null;
                      },
                    ),
                    Label(
                      value: 'Descrição',
                    ),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      elevation: 7.0,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        controller: _descricao,
                        focusNode: descricaoFocusNode,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10.0),
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
                          isbusy: Provider.of<RelatarNotifier>(context).loading,
                          function: () async {
                            if (_formKey.currentState.validate()) {
                              if (_image != null) {
                                base64Image =
                                    base64Encode(_image.readAsBytesSync());
                              } else {
                                base64Image = "sem imagem";
                              }

                              formulario = {
                                "problema": _problema.text,
                                "endereco": _endereco.text,
                                "descricao": _descricao.text,
                                "imagem": base64Image
                              };
                              await Provider.of<RelatarNotifier>(context)
                                  .putRelatar(formulario);
                              if (Provider.of<RelatarNotifier>(context)
                                  .requestSucces) {
                                _problema.clear();
                                _endereco.clear();
                                _descricao.clear();
                                Provider.of<RelatarNotifier>(context)
                                    .deleteImage();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      Provider.of<RelatarNotifier>(context)
                                          .successMessage),
                                  backgroundColor: Colors.green,
                                ));
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      Provider.of<RelatarNotifier>(context)
                                          .errorMessage),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          },
                          text: 'Confirmar',
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
