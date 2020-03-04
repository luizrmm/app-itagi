import 'package:aqui_cliente/models/prefeito_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class PrefeitoRepository {
  Future<PrefeitoModel> getPrefeitoData() async {
    try {
      Response response = await dio.get("/sobre/buscar_informacoes/2");
      return PrefeitoModel.fromJson(response.data['mensagem']);
    } on DioError catch (e) {
      throw e;
    }
  }
}
