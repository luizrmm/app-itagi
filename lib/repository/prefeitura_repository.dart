import 'package:aqui_cliente/models/prefeitura_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class PrefeituraRepository {
  Dio dio = CustomDio().instance;
  Future<PrefeituraModel> getPrefeitoData() async {
    try {
      Response response = await dio.get("/sobre/buscar_informacoes/2");
      return PrefeituraModel.fromJson(response.data['mensagem']);
    } on DioError catch (e) {
      throw e;
    }
  }
}
