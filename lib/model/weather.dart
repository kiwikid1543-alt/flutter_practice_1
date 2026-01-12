import 'package:flutter_practice_1/model/current_weather.dart';
import 'package:flutter_practice_1/model/current_weather_units.dart';

class Weather {
  /// 위도
  final double latitude;

  /// 경도
  final double longitude;

  /// 생성 소요 시간 (ms)
  final double generationtimeMs;

  /// UTC 오프셋 (초)
  final int utcOffsetSeconds;

  /// 타임존 (예: GMT)
  final String timezone;

  /// 타임존 약어
  final String timezoneAbbreviation;

  /// 고도
  final double elevation;

  /// 현재 날씨 데이터의 단위 정보
  final CurrentWeatherUnits currentWeatherUnits;

  /// 현재 날씨 데이터
  final CurrentWeather currentWeather;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      generationtimeMs: json['generationtime_ms']?.toDouble() ?? 0.0,
      utcOffsetSeconds: json['utc_offset_seconds']?.toInt() ?? 0,
      timezone: json['timezone'] ?? '',
      timezoneAbbreviation: json['timezone_abbreviation'] ?? '',
      elevation: json['elevation']?.toDouble() ?? 0.0,
      currentWeatherUnits: CurrentWeatherUnits.fromJson(
        json['current_weather_units'],
      ),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}
