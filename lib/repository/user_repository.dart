import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:aqui_cliente/utils/utils.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Utils utils = new Utils();
  Future<UserModel> authenticate(String email, String password) async {
    try {
      Response response = await dio
          .put('/usuario/login', data: {"email": email, "senha": password});
      await utils.setToken(response.data["Token"]);
      return UserModel.fromJson(response.data["mensagem"]);
    } on DioError catch (erro) {
      throw erro;
    }
  }
}
