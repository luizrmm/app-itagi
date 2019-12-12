import 'dart:convert';

import 'package:aqui_cliente/models/cidade_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroNotifier with ChangeNotifier {
  final String baseUrl = 'https://projetos.smtech.dev/sistema-prefeitura/api/';

  List<String> _estados;
  List<String> get estados => _estados;

  String _estado;
  String get estado => _estado;

  String _city;
  String get city => _city;

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  List<CidadeModel> _cidades;
  List<CidadeModel> get cidades => _cidades;

  CadastroNotifier() {
    _estados = [
      "AC",
      "AL",
      "AP",
      "AM",
      "BA",
      "CE",
      "DF",
      "ES",
      "GO",
      "MA",
      "MT",
      "MS",
      "MG",
      "PA",
      "PB",
      "PR",
      "PE",
      "PI",
      "RJ",
      "RN",
      "RS",
      "RO",
      "RR",
      "SC",
      "SP",
      "SE",
      "TO"
    ];
  }

  Future getCidades(String sigla) async {
    Map<String, dynamic> data;
    List<dynamic> list;
    setLoading(true);
    http.Response response =
        await http.get('$baseUrl/cidades/buscar_cidades/$sigla');
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      list = data["mensagem"] as List;
      _cidades = list.map((value) => CidadeModel.fromJson(value)).toList();
      setLoading(false);
    } else {
      _errorMessage = data["mensagem"];
      setLoading(false);
    }
  }

  void changeValue(String newValue) {
    _estado = newValue;
    _city = null;
    getCidades(newValue);
    notifyListeners();
  }

  void changeCidade(String newValue) {
    _city = newValue;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
