import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';

class PesquisaNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
