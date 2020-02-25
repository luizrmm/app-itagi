import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:aqui_cliente/utils/utils.dart';
import 'package:aqui_cliente/view-models/login_viewmodel.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Utils utils = new Utils();
  Future<UserModel> authenticate(LoginViewModel model) async {
    try {
      Response response = await dio.put('/usuario/login',
          data: {"email": model.email, "senha": model.password});
      await utils.setToken(response.data["Token"]);
      return UserModel.fromJson(response.data["mensagem"]);
    } on DioError catch (erro) {
      throw erro;
    }
  }
}
