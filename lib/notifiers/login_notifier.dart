import 'dart:convert';

import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;
  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  UserModel _user;
  UserModel get user => _user;

  Future logar(String email, String password) async {
    setLoading(true);
    Map<String, dynamic> data;
    http.Response response = await http.put('$baseUrl/usuario/login',
        body: {'email': email, 'senha': password});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      _user = UserModel.fromJson(data["mensagem"]);
      setToken(data["mensagem"]["token"]);
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

  Future setToken(String token) async {
    print("Login " + token.substring(0, 10));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
