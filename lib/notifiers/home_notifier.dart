import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;

  String _token;
  String get token => _token;

  Future saveFCM(Map<String, dynamic> json) async {
    await http.put('$baseUrl/push_notification/enviar_key', body: json);
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }
}
