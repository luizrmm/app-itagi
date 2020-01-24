import 'package:shared_preferences/shared_preferences.dart';

class ApiUtils {
  // final String baseUrl = 'https://barreiras.prefeituraconectada.com.br/api';
  final String baseUrl = 'https://prefeitura-barreiras.bastostech.com/api/';

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }
}
