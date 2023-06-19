import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/api/api_call.dart';

// <Map<String, Map<String, dynamic>>>
class ApiNotifier extends StateNotifier<Map<String, List<dynamic>>> {
  ApiNotifier()
      : super(
          {
            "daily": [],
            "weekly": [],
            "tempUnit": ["celsius"],
            "windUnit": ["kmh"],
            "points": [0, 0],
          },
        ); // making an empty api provider and giving the super class an empty map

  double longitude = 0,
      latitude = 0; // fetching the data from the constructor itself

  var dailyData = [];
  var weeklyData = [];
  var tempUnit = ["celsius"];
  var windUnit = ["kmh"];

  bool getTempUnit() {
    bool temp = true;
    if (tempUnit[0] == "fahrenheit") {
      temp = false;
    }
    return temp;
  }

  bool getWindUnit() {
    bool temp = true;
    if (windUnit[0] == "mph") temp = false;
    return temp;
  }

  // make an api call to get the data set into the super class
  void setPoints(double longitude, double latitude) async {
    this.longitude = longitude;
    this.latitude = latitude;
    tempUnit = ["celsius"];
    windUnit = ["kmh"];

    state = await {
      "daily": dailyData,
      "weekly": weeklyData,
      "tempUnit": tempUnit,
      "windUnit": windUnit,
      "points": [longitude, latitude],
    };
  }

  Future<void> changeUnit(List<bool> change) async {
    if (change[0])
      tempUnit = ["celsius"];
    else
      tempUnit = ["fahrenheit"];

    if (change[1])
      windUnit = ["kmh"];
    else
      windUnit = ["mph"];

    var api = ApiCall(
      longitude,
      latitude,
      true,
      tempUnit[0],
      windUnit[0],
      true,
    );
    await api.callAPI();
    dailyData = api.getDailyWeather();

    api = ApiCall(
      longitude,
      latitude,
      false,
      tempUnit[0],
      windUnit[0],
      true,
    );
    await api.callAPI();

    weeklyData = api.getWeeklyWeather();

    state = {
      "daily": dailyData,
      "weekly": weeklyData,
      "tempUnit": tempUnit,
      "windUnit": windUnit,
      "points": [longitude, latitude],
    };
  }

  Future<void> getWeather() async {
    var api = ApiCall(
      longitude,
      latitude,
      true,
      tempUnit[0],
      windUnit[0],
      false,
    );
    await api.callAPI();
    dailyData = api.getDailyWeather();

    api = ApiCall(
      longitude,
      latitude,
      false,
      tempUnit[0],
      windUnit[0],
      false,
    );
    await api.callAPI();

    weeklyData = api.getWeeklyWeather();

    state = {
      "daily": dailyData,
      "weekly": weeklyData,
      "tempUnit": tempUnit,
      "windUnit": windUnit,
      "points": [longitude, latitude],
    };
  }
}

final StateNotifierProvider<ApiNotifier, Map<String, dynamic>> ApiProvider =
    StateNotifierProvider((ref) => ApiNotifier());
