import 'package:aqui_cliente/models/pontosInteresse_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PontosInteresseNotifier with ChangeNotifier {
  final String baseUrl = 'https://projetos.smtech.dev/sistema-prefeitura/api/';

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  List<PontosInteresseModel> _pontos;
  List<PontosInteresseModel> get pontos => _pontos;

  PontosInteresseNotifier() {
    getPontosInteresse();
  }

  Future getPontosInteresse() async {
    setLoading(true);
    Map<String, dynamic> data;
    List<dynamic> list;
    http.Response response =
        await http.get('$baseUrl/telefones/buscar_telefones/1');
    data = jsonDecode(response.body);
    list = data["mensagem"] as List;
    if (response.statusCode == 200) {
      _pontos =
          list.map((value) => PontosInteresseModel.fromJson(value)).toList();
      print(_pontos[0].secretaria);
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
