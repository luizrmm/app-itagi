import 'package:aqui_cliente/utils/constants.dart';
import 'package:aqui_cliente/utils/utils.dart';
import 'package:dio/dio.dart';

class CustomDio {
  Dio _dio;
  // Utils utils = new Utils();

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = urlProd;
  }

  CustomDio.withToken() {
    _dio = Dio();
    _dio.options.baseUrl = urlProd;
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }
  Dio get instance => _dio;
  _onError(DioError e) {
    return e;
  }

  _onRequest(RequestOptions options) async {
    String token = await getToken();
    options.headers['Token'] = token;
  }

  _onResponse(Response e) {}
}
