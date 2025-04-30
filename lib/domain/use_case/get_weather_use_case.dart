import 'package:app_tennis/data/models/result.dart';
import 'package:app_tennis/domain/entities/weather.dart';
import 'package:app_tennis/domain/repository/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  Future<Result<Weather, BackendError>> getData({
    required double latitud,
    required double longitud,
  }) async {
    return await _weatherRepository.getData(
      latitud: latitud,
      longitud: longitud,
    );
  }
}
