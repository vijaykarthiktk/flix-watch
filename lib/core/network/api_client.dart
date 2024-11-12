import 'package:dio/dio.dart';
import 'package:flixwatch/core/secrets/secrets.dart';

import '../error/failures.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3/',
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${Secrets.accessTokenAuth}"
          },
        ));
  Future<Response> get(String path,
      { Map<String, dynamic>? queryParameters,
        String movieID = 'movie_id',
        String appendToResponse = ''
      }) async {
    try {
      final response = await _dio.get(path.replaceAll('{movie_id}', movieID),
          queryParameters: queryParameters?..addAll({
            'append_to_response': appendToResponse
          }));
      return response;
    } catch (e,s) {
      throw UnknownFailure(e.toString(), stackTrace: s);
    }
  }
}
