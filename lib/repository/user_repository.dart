import 'package:aqui_cliente/models/cidade_model.dart';
import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/utils/apis.dart';

import 'package:aqui_cliente/utils/utils.dart';
import 'package:aqui_cliente/view-models/cadastro_viewmodel.dart';
import 'package:aqui_cliente/view-models/login_viewmodel.dart';
import 'package:aqui_cliente/view-models/perfil_viewmodel.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Dio dio = CustomDio().instance;
  Dio dioToken = CustomDio.withToken().instance;

  Future<UserModel> authenticate(LoginViewModel model) async {
    try {
      Response response = await dio.put('/usuario/login',
          data: {"email": model.email, "senha": model.password});
      await setToken(response.data["mensagem"]['token']);
      return UserModel.fromJson(response.data["mensagem"]);
    } on DioError catch (erro) {
      throw erro;
    }
  }

  Future account(CadastroViewModel model) async {
    try {
      Response response = await dio.put(
        '/usuario/cadastrar',
        data: {
          "nome": model.nome,
          "senha": model.senha,
          "email": model.email,
          "telefone": model.telefone,
          "endereco": model.endereco,
          "numero": model.numero,
          "bairro": model.bairro,
          "complemento": model.complemento,
          "cidade_id": model.cidadeId
        },
      );
      return response.data['mensagem'];
    } on DioError catch (e) {
      throw e;
    }
  }

  Future getCidades(String sigla) async {
    List list = new List();
    try {
      Response response = await dio.get('/cidades/buscar_cidades/$sigla');
      list = response.data['mensagem'] as List;
      return list.map((value) => CidadeModel.fromJson(value)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUser() async {
    try {
      Response response = await dioToken.get(
        '/usuario/perfil',
      );
      return UserModel.fromJson(response.data['mensagem']);
    } on DioError catch (e) {
      throw e;
    }
  }

  Future editPerfil(PerfilViewModel model) async {
    try {
      Response response = await dio.put(
        '/usuario/editar_perfil',
        data: {
          "nome": model.nome,
          "email": model.email,
          "telefone": model.telefone,
          "endereco": model.endereco,
          "numero": model.numero,
          "bairro": model.bairro,
          "complemento": model.complemento,
          "cidade_id": model.cidadeId
        },
      );
      return response.data['mensagem'];
    } on DioError catch (e) {
      throw e;
    }
  }
}
