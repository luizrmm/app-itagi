import 'dart:convert';

import 'package:aqui_cliente/models/cidade_model.dart';
import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;

  List<String> _estados;
  List<String> get estados => _estados;

  String _estado;
  String get estado => _estado;

  String _city;
  String get city => _city;

  bool _loading = false;
  bool get loading => _loading;

  bool _loadingcity = false;
  bool get loadingcity => _loadingcity;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

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
    changeValue('BA');
    changeCidade('472');
  }

  Future getCidades(String sigla) async {
    Map<String, dynamic> data;
    List<dynamic> list;
    setLoadingcity(true);
    http.Response response =
        await http.get('$baseUrl/cidades/buscar_cidades/$sigla');

    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      list = data["mensagem"] as List;
      _cidades = list.map((value) => CidadeModel.fromJson(value)).toList();
      setLoadingcity(false);
    } else {
      _errorMessage = data["mensagem"];
      setLoadingcity(false);
    }
  }

  Future cadastrar(UserModel user, String password) async {
    setLoading(true);
    Map<String, dynamic> data;
    Map<String, dynamic> json = {
      "nome": user.nome,
      "senha": password,
      "email": user.email,
      "telefone": user.telefone,
      "endereco": user.endereco,
      "numero": user.numero,
      "bairro": user.bairro,
      "complemento": user.complemento,
      "cidade_id": user.cidadeId
    };
    http.Response response = await http.put(
      '$baseUrl/usuario/cadastrar',
      body: json,
    );
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      _successMessage = data["mensagem"];
      setLoading(false);
    } else {
      _requestSucces = false;
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
    print(newValue);
    _city = newValue;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setLoadingcity(bool value) {
    _loadingcity = value;
    notifyListeners();
  }
}
