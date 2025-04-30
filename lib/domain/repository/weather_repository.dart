import 'package:app_tennis/data/models/result.dart';
import 'package:app_tennis/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Result<Weather, BackendError>> getData({
    required double latitud,
    required double longitud,
  });
  
}
