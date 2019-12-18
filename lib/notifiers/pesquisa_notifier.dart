import 'dart:convert';

import 'package:aqui_cliente/models/option_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PesquisaNotifier with ChangeNotifier {
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

  List<OptionModel> _options;
  List<OptionModel> get options => _options;

  int _isSelected;
  int get isSelected => _isSelected;

  Future getOptions() async {
    setLoading(true);
    Map<String, dynamic> data;
    List<dynamic> list;
    http.Response response =
        await http.get('$baseUrl/pesquisa_satisfacao/buscar_pesquisa');
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      list = data["mensagem"] as List;
      _options = list.map((value) => OptionModel.fromJson(value)).toList();
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data['mensagem'];
      setLoading(false);
    }
  }

  Future votar(Map<String, dynamic> json) async {
    setLoading(true);
    Map<String, dynamic> data;
    token = await ApiUtils().getToken();
    var teste = jsonEncode(json);
    print(teste);
    http.Response response = await http.put(
        '$baseUrl/pesquisa_satisfacao/enviar_satisfacao',
        headers: {'Token': token},
        body: teste);
    data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data);
      setLoading(false);
    } else {
      print(data);
      setLoading(false);
    }
  }

  void select(int value) {
    _isSelected = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
