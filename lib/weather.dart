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

class CurrentWeatherUnits {
  /// 시간 형식
  final String time;

  /// 간격 단위
  final String interval;

  /// 온도 단위
  final String temperature;

  /// 풍속 단위
  final String windspeed;

  /// 풍향 단위
  final String winddirection;

  /// 낮/밤 구분 형식
  final String isDay;

  /// 날씨 코드 형식
  final String weathercode;

  CurrentWeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherUnits(
      time: json['time'] ?? '',
      interval: json['interval'] ?? '',
      temperature: json['temperature'] ?? '',
      windspeed: json['windspeed'] ?? '',
      winddirection: json['winddirection'] ?? '',
      isDay: json['is_day'] ?? '',
      weathercode: json['weathercode'] ?? '',
    );
  }
}

class CurrentWeather {
  /// 데이터 기록 시간
  final DateTime time;

  /// 데이터 갱신 간격
  final int interval;

  /// 기온
  final double temperature;

  /// 풍속
  final double windspeed;

  /// 풍향 (도)
  final int winddirection;

  /// 낮 여부 (1: 낮, 0: 밤)
  final int isDay;

  /// 기상 상태 코드
  final int weathercode;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: DateTime.parse(json['time']),
      interval: json['interval']?.toInt() ?? 0,
      temperature: json['temperature']?.toDouble() ?? 0.0,
      windspeed: json['windspeed']?.toDouble() ?? 0.0,
      winddirection: json['winddirection']?.toInt() ?? 0,
      isDay: json['is_day']?.toInt() ?? 0,
      weathercode: json['weathercode']?.toInt() ?? 0,
    );
  }
}
