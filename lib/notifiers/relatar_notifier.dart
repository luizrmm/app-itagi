import 'dart:io';
import 'dart:convert';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RelatarNotifier with ChangeNotifier {
  String baseUrl = ApiUtils().baseUrl;
  File _image;
  File get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  String token;

  Future getImage(int value) async {
    if (value == 0) {
      File eoq = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 40);
      _image = eoq;
      notifyListeners();
    } else {
      File eoq = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      _image = eoq;
      notifyListeners();
    }
  }

  void deleteImage() {
    _image = null;
    notifyListeners();
  }

  Future putRelatar(Map<String, dynamic> json) async {
    setLoading(true);
    token = await getToken();
    Map<String, dynamic> data;
    http.Response response = await http.put(
        '$baseUrl/relatar_problema/enviar_problema',
        headers: {'Token': token},
        body: json);
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

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return token;
  }
}
