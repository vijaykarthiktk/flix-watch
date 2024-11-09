import 'package:dio/dio.dart';
import 'package:flixwatch/core/secrets/secrets.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    headers: {
      "accept": "application/json",
      "Authorization": "Bearer ${Secrets.accessTokenAuth}"
    },
  ));
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}