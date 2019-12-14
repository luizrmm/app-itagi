import 'dart:convert';

import 'package:aqui_cliente/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PerfilNotifier with ChangeNotifier {
  final String baseUrl = 'https://projetos.smtech.dev/sistema-prefeitura/api/';

  String token;

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  UserModel _userPerfil;
  UserModel get userPerfil => _userPerfil;

  bool _isEditable = false;
  bool get isEditable => _isEditable;

  Future getPerfil() async {
    setLoading(true);
    token = await getToken();
    Map<String, dynamic> data;
    http.Response response =
        await http.get('$baseUrl/usuario/perfil', headers: {'Token': token});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _userPerfil = UserModel.fromJson(data["mensagem"]);
      setLoading(false);
    } else {
      print(data);
      setLoading(false);
    }
  }

  Future editarPerfil(Map<String, dynamic> json) async {
    setLoading(true);
    token = await getToken();
    Map<String, dynamic> data;
    http.Response response = await http.put('$baseUrl/usuario/editar_perfil',
        headers: {'Token': token}, body: json);
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      _successMessage = data["mensagem"];
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data["mensgem"];
      setLoading(false);
    }
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return token;
  }

  deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  void enableEdit(bool value) {
    _isEditable = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
