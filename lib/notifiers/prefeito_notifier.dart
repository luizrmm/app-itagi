import 'package:aqui_cliente/models/prefeito_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrefeitoNotifier with ChangeNotifier {
  final String baseUrl = 'https://projetos.smtech.dev/sistema-prefeitura/api/';

  bool _loading = false;
  bool get loading => _loading;

  PrefeitoModel _prefeito;
  PrefeitoModel get prefeito => _prefeito;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  Future getPrefeitoData() async {
    setLoading(true);
    Map<String, dynamic> data;
    http.Response response =
        await http.get("$baseUrl/sobre/buscar_informacoes/2");
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _prefeito = PrefeitoModel.fromJson(data["mensagem"]);
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
