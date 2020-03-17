import 'package:aqui_cliente/models/noticia_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class NoticiasRepository {
  Dio dio = CustomDio.withToken().instance;
  Future getNoticias() async {
    List list = new List();
    try {
      Response response = await dio.get('/noticias/buscar_noticias/1');
      list = response.data['mensagem'] as List;
      return list.map((value) => NoticiaModel.fromJson(value)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }

  Future curtir(Map<String, dynamic> json) async {
    try {
      Response response = await dio.put('/noticias/curtidas/', data: json);
      return response.data['mensagem'];
    } catch (e) {
      throw e;
    }
  }
}
