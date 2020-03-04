import 'package:aqui_cliente/utils/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  Future setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future saveFCM(Map<String, dynamic> json) async {
    await dio.put('/push_notification/enviar_key', data: json);
  }

  Future clearToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
