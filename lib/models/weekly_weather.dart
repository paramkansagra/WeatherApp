class WeeklyWeather {
  WeeklyWeather({
    required this.day,
    required this.tempratureMax,
    required this.tempratureMin,
    required this.weatherCode,
    required this.sunrise,
    required this.sunset,
  });

  final int day;
  final String weatherCode;
  final int tempratureMax;
  final int tempratureMin;
  final String sunrise;
  final String sunset;
}
