import 'package:app_tennis/domain/use_case/get_my_reservations_use_case.dart';
import 'package:app_tennis/domain/use_case/get_user_use_case.dart';
import 'package:app_tennis/domain/use_case/new_reservation_use_case.dart';
import 'package:dio/dio.dart' as client;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_tennis/data/api/base_client.dart';
import 'package:app_tennis/data/data_source/local/database_helper.dart';
import 'package:app_tennis/data/data_source/remote/data_source.dart';
import 'package:app_tennis/data/repository/tennis_courts_repository.dart';
import 'package:app_tennis/data/repository/user_local_repository_impl.dart';
import 'package:app_tennis/data/repository/weather_repository_imp.dart';
import 'package:app_tennis/data/service/location_service.dart';
import 'package:app_tennis/domain/repository/tennis_courts_repository.dart';
import 'package:app_tennis/domain/repository/user_local_repository.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:app_tennis/domain/use_case/get_tennis_court_use_case.dart';
import 'package:app_tennis/domain/use_case/get_weather_use_case.dart';
import 'package:app_tennis/domain/use_case/insert_tennis_court.dart';
import 'package:app_tennis/domain/use_case/login_use_case.dart';
import 'package:app_tennis/domain/use_case/register_use_case.dart';
import 'package:app_tennis/enviroment.dart';

part 'dependency_injector.g.dart';

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(Ref ref) => AppRouter();

@riverpod
BaseClient baseClient(Ref ref) {
  final dio = client.Dio();
  return BaseClient(client: dio, host: Enviroment.basePath);
}

@riverpod
WeatherDataSource weatherDataSource(Ref ref) {
  final baseClient = ref.watch(baseClientProvider);
  return WeatherDataSource(apiUtils: baseClient);
}

@riverpod
WeatherRepositoryImp weatherRepository(Ref ref) {
  final weatherDataSource = ref.watch(weatherDataSourceProvider);
  return WeatherRepositoryImp(weatherDataSource: weatherDataSource);
}

@riverpod
GetWeatherUseCase getWeatherUseCase(Ref ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return GetWeatherUseCase(weatherRepository: weatherRepository);
}

@riverpod
LocationService locationService(Ref ref) {
  return LocationService();
}

@riverpod
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

@riverpod
UserLocalRepository userLocalRepository(Ref ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return UserLocalRepositoryImpl(databaseHelper: databaseHelper);
}

@riverpod
RegisterUserUseCase registerUseCase(Ref ref) {
  final userLocalRepository = ref.watch(userLocalRepositoryProvider);
  return RegisterUserUseCase(userRepository: userLocalRepository);
}

@riverpod
LoginUserUseCase loginUserUseCase(Ref ref) {
  final userLocalRepository = ref.watch(userLocalRepositoryProvider);
  return LoginUserUseCase(userRepository: userLocalRepository);
}

@riverpod
TennisCourtsRepository tennisCourtsRepository(Ref ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return TennisCourtsRepositoryImpl(databaseHelper: databaseHelper);
}

@riverpod
InsertTennisCourtUsecase insertTennisCourtUsecase(Ref ref) {
  final tennisCourtsRepository = ref.watch(tennisCourtsRepositoryProvider);
  return InsertTennisCourtUsecase(
    tennisCourtsRepository: tennisCourtsRepository,
  );
}

@riverpod
GetTennisCourtUsecase getTennisCourtUsecase(Ref ref) {
  final tennisCourtsRepository = ref.watch(tennisCourtsRepositoryProvider);
  return GetTennisCourtUsecase(tennisCourtsRepository: tennisCourtsRepository);
}

@riverpod
GetUserUseCase getUserUseCase(Ref ref) {
  final userLocalRepository = ref.watch(userLocalRepositoryProvider);
  return GetUserUseCase(userLocalRepository: userLocalRepository);
}

@riverpod 
InsertReservationUserUseCase insertReservationUserUseCase(Ref ref) {
  final tennisCourtsRepository = ref.watch(tennisCourtsRepositoryProvider);
  return InsertReservationUserUseCase(
    tennisCourtsRepository: tennisCourtsRepository,
  );
}

@riverpod
GetMyReservationsUsecase getMyReservationsUsecase (Ref ref){
  final tennisCourtsRepository = ref.watch(tennisCourtsRepositoryProvider);
  return GetMyReservationsUsecase(
    tennisCourtsRepository: tennisCourtsRepository,
  );
} 