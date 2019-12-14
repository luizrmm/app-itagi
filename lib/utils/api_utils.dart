import 'package:shared_preferences/shared_preferences.dart';

class ApiUtils {
  final String baseUrl = 'https://projetos.smtech.dev/sistema-prefeitura/api';

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }
}
