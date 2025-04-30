import 'package:dio/dio.dart';
import 'package:app_tennis/data/api/api_exceptions.dart';
import 'package:app_tennis/data/models/result.dart';

enum Method { get, post }

class BaseClient {
  final Dio _client;
  final String _host;

  BaseClient({required Dio client, required String host})
    : _client = client,
      _host = host;

  Future<Result<dynamic, BackendError>> makeRequest({
    dynamic data,
    Map<String, dynamic>? headers,
    required Method method,
    required String path,
    Map<String, dynamic>? queryParameters,
    String? temporalHost,
  }) async {
    Map<String, dynamic> headers0 = <String, dynamic>{};

    headers0.addAll(headers ?? {});

    Uri uri = Uri.https(temporalHost ?? _host, path, queryParameters);

    final Response response;

    final Options options = Options(headers: headers0);

    try {
      switch (method) {
        case Method.get:
          response = await _client.getUri(uri, options: options);
          break;

        case Method.post:
          response = await _client.postUri(uri, data: data, options: options);
          break;
      }
      return Result.success(response.data);
    } on DioException catch (error) {
      return ApiExceptions().handleErrors(error);
    }
  }
}
