import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CitiesNotifier extends StateNotifier<List<Map<dynamic, dynamic>>> {
  CitiesNotifier()
      : super(
          [
            {
              "name": "Guwahati",
              "longitude": 91.75,
              "latitude": 26.18,
              "temprature": 30,
              "weather_code": 0,
            },
          ],
        );

  List<Map<dynamic, dynamic>> getCities() {
    return state;
  }

  Future<Map<String, dynamic>> getCurrentWeather(
      double longitude, double latitude) async {
    String currentWeather =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true";

    final url = Uri.parse(currentWeather);
    final responce = await http.get(url);

    var _data = jsonDecode(responce.body);
    Map<String, dynamic> returnData = {
      "longitude": _data["longitude"],
      "latitude": _data["latitude"],
      "temprature": _data["current_weather"]["temprature"],
      "weather_code": _data["current_weather"]["weathercode"],
    };

    return returnData;
  }

  Future<void> addCity(double longitude, double latitude, String name) async {
    Map<String, dynamic> getData = await getCurrentWeather(longitude, latitude);

    state = [
      ...state,
      {
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
        "temprature": getData["temprature"],
        "weather_code": getData["weather_code"],
      }
    ];
  }
}

final StateNotifierProvider<CitiesNotifier, List<Map<dynamic, dynamic>>>
    CitiesProvider = StateNotifierProvider(
  (ref) => CitiesNotifier(),
);
