import 'package:app_tennis/data/api/base_client.dart';
import 'package:app_tennis/data/models/result.dart';
import 'package:app_tennis/data/models/weather_model.dart';
import 'package:app_tennis/enviroment.dart';

class WeatherDataSource {
  final BaseClient _apiUtils;

  WeatherDataSource({required BaseClient apiUtils}) : _apiUtils = apiUtils;

  Future<Result<WeatherModel, BackendError>> getWeatherByLocation(
    double latitlatud,
    double longitud,
  ) async {
    String path = '/v1/forecast.json';
    final queryParameters = {
      'q': '$latitlatud,$longitud',
      'lang': 'es',
      'days':'14',
      'alerts':'no',
      'key': Enviroment.publicApiKey,
    };
    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.get,
      path: path,
      queryParameters: queryParameters,
    );

    return result.when( 
      fail: (fail) => Fail(fail),
      success: (success) {
        return Success(WeatherModel.fromJson(success));
      },
    );
  }
}
