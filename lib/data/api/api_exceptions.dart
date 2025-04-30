import 'package:dio/dio.dart';
import 'package:app_tennis/data/models/result.dart';

class ApiExceptions implements Exception {
  handleErrors(DioException error) {
    switch (error.type) {
      case DioException.connectionTimeout:
      case DioException.receiveTimeout:
      case DioException.sendTimeout:
        return Result.fail(
          BackendError(
            statusCode: 408,
            description: error.message,
            err: 'TimeOut',
          ),
        );
      default:
        return Result.fail(
          BackendError(
            data:
                error.response?.data is String
                    ? {"message": ''}
                    : (error.response!.data as Map),
            description: error.message,
            err: error.error.toString(),
            statusCode: error.response?.statusCode ?? -1,
          ),
        );
    }
  }
}
