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
