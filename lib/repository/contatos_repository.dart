import 'package:aqui_cliente/models/pontosInteresse_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class ContatosRepository {
  Dio dio = CustomDio().instance;
  Future<List<PontosInteresseModel>> getContatos() async {
    List list = new List();
    try {
      Response response = await dio.get('/telefones/buscar_telefones/2');
      list = response.data['mensagem'] as List;
      return list.map((value) => PontosInteresseModel.fromJson(value)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }
}
