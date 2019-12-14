import 'dart:convert';

import 'package:aqui_cliente/models/enquete_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NovasEnqueteNotifier with ChangeNotifier {
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

  List<EnqueteModel> _novasEnquetes;
  List<EnqueteModel> get novasEnquetes => _novasEnquetes;

  Future getNovasEnquetes() async {
    setLoading(true);
    Map<String, dynamic> data;
    List<dynamic> list;
    token = await ApiUtils().getToken();
    http.Response response = await http.get(
        '$baseUrl/enquetes/buscar_enquetes_nova',
        headers: {'Token': token});
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      list = data["mensagem"] as List;
      _novasEnquetes =
          list.map((value) => EnqueteModel.fromJson(value)).toList();
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data['mensagem'];
      setLoading(false);
    }
  }

  Future votarEnquete(String enqueteId, String voto) async {
    setLoading(true);
    token = await ApiUtils().getToken();
    Map<String, dynamic> data;
    http.Response response = await http.put('$baseUrl/enquetes/votar_enquete',
        headers: {'Token': token},
        body: {"enquete_id": enqueteId, "voto": voto});
    data = jsonDecode(response.body);
    print(data);
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

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
