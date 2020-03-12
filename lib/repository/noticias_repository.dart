import 'package:aqui_cliente/models/noticia_model.dart';
import 'package:aqui_cliente/utils/apis.dart';
import 'package:dio/dio.dart';

class NoticiasRepository {
  Dio dio = CustomDio.withToken().instance;
}
