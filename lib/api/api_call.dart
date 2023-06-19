import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/weather_code.dart';
import 'package:weather_app/models/weekly_weather.dart';

List<DailyWeather> dailyWeather = [];
List<WeeklyWeather> weeklyWeather = [];

class ApiCall {
  ApiCall(
    this.longitude,
    this.latitude,
    this.currentWeather,
    this.add,
    this.isChanged,
  );

  final longitude, latitude, currentWeather, add, isChanged;
  Map<String, dynamic> _data = {};
  Map<String, dynamic> _airQuality = {};

  Future<void> callAirQualityAPI() async {
    String airQualityAPI =
        "https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$latitude&longitude=$longitude&hourly=european_aqi&timezone=auto";
    final url = Uri.parse(airQualityAPI);

    final response = await http.get(url);

    _airQuality = jsonDecode(response.body);
    if (_airQuality["error"] == true) {
      return;
    }
  }

  Future<void> callAPI() async {
    if (isChanged) {
      dailyWeather = [];
      weeklyWeather = [];
    }

    await callAirQualityAPI();

    String currentWeatherAPI =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,is_day,relativehumidity_2m,apparent_temperature,weathercode,windspeed_10m,winddirection_10m,uv_index_clear_sky&models=best_match&forecast_days=2&timezone=auto&temperature_unit=$add";
    String futureWeatherAPI =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&models=best_match&daily=sunrise,sunset,weathercode,temperature_2m_max,temperature_2m_min&timezone=auto&temperature_unit=$add";
    final url =
        Uri.parse(currentWeather ? currentWeatherAPI : futureWeatherAPI);
    final responce = await http.get(url);

    _data = jsonDecode(responce.body);
    if (_data["error"].toString() == "true") {
      return;
    }

    // now we will be making objects of the data we are getting

    // first check if the data is of the current or of the future as for both the objects are different
    if (currentWeather) {
      List<dynamic> time = _data["hourly"]["time"];
      List<dynamic> temprature = _data["hourly"]["temperature_2m"];
      List<dynamic> reletiveHumidity = _data["hourly"]["relativehumidity_2m"];
      List<dynamic> apparentTemperature =
          _data["hourly"]["apparent_temperature"];
      List<dynamic> weathercode = _data["hourly"]["weathercode"];
      List<dynamic> windSpeed = _data["hourly"]["windspeed_10m"];
      List<dynamic> windDirection = _data["hourly"]["winddirection_10m"];
      List<dynamic> uvIndex = _data["hourly"]["uv_index_clear_sky"];
      List<dynamic> isDay = _data["hourly"]["is_day"];
      List<dynamic> aqi = _airQuality["hourly"]["european_aqi"];

      var count = dailyWeather.length;

      final hourNow = DateTime.now();

      for (var i = 0; i < time.length; i++) {
        final listTime = DateTime.parse(time[i]);
        if ((listTime.hour >= hourNow.hour || listTime.day > hourNow.day) &&
            count < 12) {
          final dailyWeatherObject = DailyWeather(
            time: "0" * (2 - listTime.hour.toString().length) +
                listTime.hour.toString() +
                ":00",
            temprature: temprature[i].toInt(),
            apparentTemperature: apparentTemperature[i].toInt(),
            humidity: reletiveHumidity[i].toInt(),
            weatherCode: WeatherCodeImage[weathercode[i].toInt()]!,
            windSpeed: windSpeed[i].toInt(),
            windDirection: windDirection[i],
            uvIndex: uvIndex[i].toInt(),
            isDay: isDay[i].toInt(),
            aqi: aqi[i].toInt(),
          );

          dailyWeather.add(dailyWeatherObject);
          count++;
        }
      }
    } else {
      List<dynamic> time = _data["daily"]["time"];
      List<dynamic> weathercode = _data["daily"]["weathercode"];
      List<dynamic> temperatureMax = _data["daily"]["temperature_2m_max"];
      List<dynamic> temperatureMin = _data["daily"]["temperature_2m_min"];
      List<dynamic> sunrise = _data["daily"]["sunrise"];
      List<dynamic> sunset = _data["daily"]["sunset"];

      var count = weeklyWeather.length;

      for (var i = 0; i < time.length && count < 7; i++) {
        final sunriseObj = DateTime.parse(sunrise[i]);
        final sunsetObj = DateTime.parse(sunset[i]);

        String sunriseHour = sunriseObj.hour.toString();
        String sunriseMinute = sunriseObj.minute.toString();

        String sunsetHour = sunsetObj.hour.toString();
        String sunsetMinute = sunsetObj.minute.toString();

        if (sunsetHour.length < 2) sunsetHour = "0" + sunsetHour;
        if (sunriseHour.length < 2) sunriseHour = "0" + sunriseHour;
        if (sunsetMinute.length < 2) sunsetMinute = "0" + sunsetMinute;
        if (sunriseMinute.length < 2) sunriseMinute = "0" + sunriseMinute;

        final weeklyWeatherObject = WeeklyWeather(
          day: DateTime.parse(time[i]).weekday,
          tempratureMax: temperatureMax[i].toInt(),
          tempratureMin: temperatureMin[i].toInt(),
          weatherCode: WeatherCodeImage[weathercode[i].toInt()]!,
          sunrise: "$sunriseHour:$sunsetMinute",
          sunset: "$sunsetHour:$sunsetMinute",
        );

        weeklyWeather.add(weeklyWeatherObject);
        count++;
      }
    }
  }

  List<DailyWeather> getDailyWeather() {
    return dailyWeather;
  }

  List<WeeklyWeather> getWeeklyWeather() {
    return weeklyWeather;
  }
}
