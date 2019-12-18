import 'dart:convert';

import 'package:aqui_cliente/models/noticia_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NoticiaNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;
  String token;

  NoticiaNotifier() {
    getNoticias("1");
    getNoticias("2");
  }

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  List<NoticiaModel> _noticias;
  List<NoticiaModel> get noticias => _noticias;

  List<NoticiaModel> _noticias2;
  List<NoticiaModel> get noticias2 => _noticias2;

  String _qtdLikes;
  String get qtdLikes => _qtdLikes;

  String _qtdDeslikes;
  String get qtdDeslikes => _qtdDeslikes;

  bool _reqLike = false;
  bool get reqLike => _reqLike;

  Future getNoticias(String tipo) async {
    setLoading(true);
    token = await ApiUtils().getToken();
    Map<String, dynamic> data;
    List<dynamic> list;
    http.Response response = await http.get(
        '$baseUrl/noticias/buscar_noticias/$tipo',
        headers: {'Token': token});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      list = data["mensagem"] as List;
      if (tipo == "1") {
        _noticias = list.map((value) => NoticiaModel.fromJson(value)).toList();
      } else {
        _noticias2 = list.map((value) => NoticiaModel.fromJson(value)).toList();
      }
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data['mensagem'];
      setLoading(false);
    }
  }

  Future curtir(Map<String, dynamic> json) async {
    Map<String, dynamic> data;

    token = await ApiUtils().getToken();
    http.Response response = await http.put('$baseUrl/noticias/curtidas',
        body: json, headers: {'Token': token});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      getNoticias("1");
      notifyListeners();
    } else {
      _requestSucces = false;
      _errorMessage = data["mensagem"];
      setLoading(false);
    }
  }

  Future curtir2(Map<String, dynamic> json) async {
    Map<String, dynamic> data;

    token = await ApiUtils().getToken();
    http.Response response = await http.put('$baseUrl/noticias/curtidas',
        body: json, headers: {'Token': token});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      getNoticias("2");
      notifyListeners();
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
