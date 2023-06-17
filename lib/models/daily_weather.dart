class DailyWeather {
  DailyWeather({
    required this.time,
    required this.temprature,
    required this.apparentTemperature,
    required this.humidity,
    required this.weatherCode,
    required this.windSpeed,
    required this.windDirection,
    required this.uvIndex,
    required this.isDay,
    required this.aqi,
  });

  final String time;
  final int temprature;
  final int apparentTemperature;
  final int humidity;
  final String weatherCode;
  final int windSpeed;
  final int windDirection;
  final int uvIndex;
  final int isDay;
  final int aqi;
}
