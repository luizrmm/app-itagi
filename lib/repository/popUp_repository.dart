import 'package:aqui_cliente/models/popup_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class PopUpRepository {
  Future getPopUp() async {
    List list = new List();
    try {
      Response response = await dio.get('/pop_up/buscar_pop_up');
      list = response.data['mensagem'] as List;
      return list.map((value) => PopModel.fromJson(value)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }
}
