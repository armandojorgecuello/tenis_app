class Weather {
  final Location location;
  final Current current;

  Weather({required this.location, required this.current});


  Weather copyWith({
    Location? location,
    Current? current,
  }) {
    return Weather(
      location: location ?? this.location,
      current: current ?? this.current,
    );
  }

}

class Location {
  final String name;
  final String region;

  Location({required this.name, required this.region});

}

class Current {
  final double tempC;
  final double? chanceOfRain;
  final Condition condition;

  Current({
    required this.tempC,
    required this.chanceOfRain,
    required this.condition,
  });

}

class Condition {
  final String text;
  final String icon;

  Condition({required this.text, required this.icon});

}
