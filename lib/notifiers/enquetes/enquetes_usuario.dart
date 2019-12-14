import 'dart:convert';

import 'package:aqui_cliente/models/enquete_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuarioEnqueteNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;
  String token;
  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  List<EnqueteModel> _usuarioEnquetes;
  List<EnqueteModel> get usuarioEnquetes => _usuarioEnquetes;

  Future getEnquetesUsuario() async {
    setLoading(true);
    token = await ApiUtils().getToken();
    Map<String, dynamic> data;
    List<dynamic> list;
    http.Response response = await http.get(
        '$baseUrl/enquetes/buscar_enquetes_usuario',
        headers: {'Token': token});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      list = data["mensagem"] as List;
      _usuarioEnquetes =
          list.map((value) => EnqueteModel.fromJson(value)).toList();
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data['mensagem'];
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
