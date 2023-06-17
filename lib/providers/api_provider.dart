import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/api/api_call.dart';

// <Map<String, Map<String, dynamic>>>
class ApiNotifier extends StateNotifier<Map<String, List<dynamic>>> {
  ApiNotifier()
      : super(
          {},
        ); // making an empty api provider and giving the super class an empty map

  double longitude = 0,
      latitude = 0; // fetching the data from the constructor itself

  var dailyData = [];
  var weeklyData = [];

  // make an api call to get the data set into the super class
  void setPoints(double longitude, double latitude) {
    this.longitude = longitude;
    this.latitude = latitude;
  }

  Future<void> getWeather() async {
    var api = ApiCall(
      longitude,
      latitude,
      true,
    );
    await api.callAPI();
    dailyData = api.getDailyWeather();

    api = ApiCall(
      longitude,
      latitude,
      false,
    );
    await api.callAPI();

    weeklyData = api.getWeeklyWeather();

    state = {
      "daily": dailyData,
      "weekly": weeklyData,
    };
  }
}

final StateNotifierProvider<ApiNotifier, Map<String, dynamic>> ApiProvider =
    StateNotifierProvider((ref) => ApiNotifier());
