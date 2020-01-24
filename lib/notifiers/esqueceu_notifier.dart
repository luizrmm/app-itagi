import 'dart:convert';

import 'package:aqui_cliente/models/recuperar_senha_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EsqueceuSenhaNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;
  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  RecuperarSenha _retorno;
  RecuperarSenha get retorno => _retorno;

  Future recuperarSenha(Map<String, dynamic> json) async {
    setLoading(true);
    Map<String, dynamic> data;
    http.Response response =
        await http.put('$baseUrl/esqueceu_senha/enviar_email', body: json);
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      _retorno = RecuperarSenha.fromJson(data["mensagem"]);
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data["mensagem"];
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
