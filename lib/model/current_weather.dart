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
