import 'dart:math';

import 'package:cubitflutter/datas/cuaca.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Cuaca> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Cuaca> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
          () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return Cuaca(
          kota: cityName,
          // Temperature between 20 and 35.99
          celcius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}