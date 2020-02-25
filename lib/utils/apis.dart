import 'package:dio/dio.dart';

const String urlProd = 'https://barreiras.prefeituraconectada.com.br/api';
const String urlDev = 'https://prefeitura-conectada.bastostech.com/api/';
Dio dio = Dio(BaseOptions(baseUrl: urlDev));
