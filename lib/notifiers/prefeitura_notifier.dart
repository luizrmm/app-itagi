import 'dart:convert';

import 'package:aqui_cliente/models/prefeitura_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrefeituraNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;

  bool _loading = false;
  bool get loading => _loading;

  PrefeituraModel _prefeitura;

  PrefeituraModel get prefeitura => _prefeitura;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  Future getPrefeituraData() async {
    setLoading(true);
    Map<String, dynamic> data;
    http.Response response =
        await http.get("$baseUrl/sobre/buscar_informacoes/1");
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _prefeitura = PrefeituraModel.fromJson(data["mensagem"]);
      setLoading(false);
    } else {
      _errorMessage = data["mensagem"];
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
