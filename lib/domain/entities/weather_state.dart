import 'package:app_tennis/domain/entities/weather.dart';

enum WeatherLoadState {
  initial,
  loading,
  loaded,
  error
}

class WeatherState {
  final Weather? weather;
  final WeatherLoadState loadState;
  final String? errorMessage;

  WeatherState({
    this.weather,
    this.loadState = WeatherLoadState.initial,
    this.errorMessage,
  });

  WeatherState copyWith({
    Weather? weather,
    WeatherLoadState? loadState,
    String? errorMessage,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      loadState: loadState ?? this.loadState,
      errorMessage: errorMessage,
    );
  }
}