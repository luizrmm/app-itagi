import 'package:aqui_cliente/models/pontosInteresse_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class PontosInteresseRespository {
  Future getPontosInteresse() async {
    List list = new List();
    try {
      Response response = await dio.get('/telefones/buscar_telefones/1');
      list = response.data['mensagem'] as List;
      return list.map((value) => PontosInteresseModel.fromJson(value)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }
}
