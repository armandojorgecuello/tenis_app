import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/entities/weather.dart';
import 'package:app_tennis/domain/entities/weather_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'weather_view_model.g.dart';

@Riverpod(keepAlive: true)
class WeatherViewmodel extends _$WeatherViewmodel {
  @override
  WeatherState build() {
    return WeatherState();
  }

  Future<void> getWeather() async {
    state = state.copyWith(loadState: WeatherLoadState.loading);

    try {
      final location =
          await ref.read(locationServiceProvider).getCurrentLocation();

      if (location == null) {
        state = state.copyWith(
          loadState: WeatherLoadState.error,
          errorMessage: 'No se pudo obtener la ubicación',
        );
        return;
      }

      final result = await ref
          .read(getWeatherUseCaseProvider)
          .getData(latitud: location.latitude, longitud: location.longitude);

      result.when(
        success: (weatherData) {
          state = state.copyWith(
            weather: Weather(
              location: weatherData.location,
              current: weatherData.current,
            ),
            loadState: WeatherLoadState.loaded,
            errorMessage: null,
          );
        },
        fail: (error) {
          state = state.copyWith(
            loadState: WeatherLoadState.error,
            errorMessage: error.toString(),
          );
        },
      );
    } catch (e) {
      // Manejo unificado de errores
      state = state.copyWith(
        loadState: WeatherLoadState.error,
        errorMessage: e.toString(),
      );
    }
  }

  // Método auxiliar para verificar si los datos están cargados
  bool get isLoaded => state.loadState == WeatherLoadState.loaded;

  // Método auxiliar para verificar si hay error
  bool get hasError => state.loadState == WeatherLoadState.error;

  // Método auxiliar para verificar si está cargando
  bool get isLoading => state.loadState == WeatherLoadState.loading;

  // Método auxiliar para obtener el mensaje de error
  String? get errorMessage => state.errorMessage;
}
