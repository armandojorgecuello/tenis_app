import 'package:app_tennis/domain/entities/weather.dart';

class WeatherModel {
  final LocationModel location;
  final CurrentModel current;

  WeatherModel({required this.location, required this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: LocationModel.fromJson(json["location"]),
    current: CurrentModel.fromJson(json["current"]),
  );

  Weather toEntity() {
    return Weather(location: location.toEntity(), current: current.toEntity());
  }
}

class LocationModel {
  final String name;
  final String region;

  LocationModel({required this.name, required this.region});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json["name"], region: json["region"]);
  }

  Location toEntity() {
    return Location(name: name, region: region);
  }
}

class CurrentModel {
  final double tempC;
  final double? chanceOfRain;
  final ConditionModel condition;

  CurrentModel({
    required this.tempC,
    required this.chanceOfRain,
    required this.condition,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      tempC: json["temp_c"],
      chanceOfRain: json["chance_of_rain"] ?? 0.0,
      condition: ConditionModel.fromJson(json["condition"]),
    );
  }

  Current toEntity() {
    return Current(
      tempC: tempC,
      chanceOfRain: chanceOfRain,
      condition: condition.toEntity(),
    );
  }
}

class ConditionModel {
  final String text;
  final String icon;

  ConditionModel({required this.text, required this.icon});

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      ConditionModel(text: json["text"], icon: json["icon"]);

  Condition toEntity() {
    return Condition(text: text, icon: icon);
  }
}
