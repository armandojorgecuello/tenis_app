import 'package:app_tennis/data/data_source/remote/data_source.dart';
import 'package:app_tennis/data/models/result.dart';
import 'package:app_tennis/domain/entities/weather.dart';
import 'package:app_tennis/domain/repository/weather_repository.dart';

class WeatherRepositoryImp implements WeatherRepository {
  final WeatherDataSource _weatherDataSource;

  WeatherRepositoryImp({required WeatherDataSource weatherDataSource})
    : _weatherDataSource = weatherDataSource;

  @override
  Future<Result<Weather, BackendError>> getData({
    required double latitud,
    required double longitud,
  }) async {
    final response = await _weatherDataSource.getWeatherByLocation(latitud, longitud);
    return response.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.toEntity()),
    );
  }
}
