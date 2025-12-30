/// 외부 기상 API로부터 받아온 전체 날씨 데이터를 담는 메인 클래스입니다.
class Weather {
  /// 요청된 위치의 위도
  final double latitude;

  /// 요청된 위치의 경도
  final double longitude;

  /// 서버에서 응답 생성에 소요된 시간 (밀리초)
  final double generationtimeMs;

  /// UTC 대비 시간 차이 (초)
  final int utcOffsetSeconds;

  /// 시간대 이름 (예: GMT)
  final String timezone;

  /// 시간대 약어 (예: GMT)
  final String timezoneAbbreviation;

  /// 요청된 위치의 해발 고도 (미터)
  final double elevation;

  /// 각 날씨 데이터 항목이 사용하는 단위 정보
  final CurrentWeatherUnits currentWeatherUnits;

  /// 현재 기상 상태 데이터
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
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentWeatherUnits: CurrentWeatherUnits.fromJson(
        json['current_weather_units'],
      ),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}

/// 날씨 데이터의 측정 단위 정보를 정의하는 클래스입니다.
class CurrentWeatherUnits {
  /// 시간 형식 (예: iso8601)
  final String time;

  /// 데이터 갱신 간격 단위 (예: seconds)
  final String interval;

  /// 온도 단위 (예: °C)
  final String temperature;

  /// 풍속 단위 (예: km/h)
  final String windspeed;

  /// 풍향 단위 (예: °)
  final String winddirection;

  /// 낮/밤 구분 형식
  final String isDay;

  /// 기상 상태 코드 형식 (예: wmo code)
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
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature: json['temperature'] as String,
      windspeed: json['windspeed'] as String,
      winddirection: json['winddirection'] as String,
      isDay: json['is_day'] as String,
      weathercode: json['weathercode'] as String,
    );
  }
}

/// 현재 시점의 구체적인 날씨 수치를 담는 클래스입니다.
class CurrentWeather {
  /// 데이터 측정 시간
  final String time;

  /// 데이터 측정 주기 (초)
  final int interval;

  /// 현재 온도
  final double temperature;

  /// 현재 풍속
  final double windspeed;

  /// 풍향 (0-360도 범위)
  final int winddirection;

  /// 낮이면 1, 밤이면 0
  final int isDay;

  /// WMO 기상 해석 코드 (예: 0은 맑음)
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
      time: json['time'] as String,
      interval: json['interval'] as int,
      temperature: (json['temperature'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddirection: json['winddirection'] as int,
      isDay: json['is_day'] as int,
      weathercode: json['weathercode'] as int,
    );
  }
}
