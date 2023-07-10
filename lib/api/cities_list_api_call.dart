import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/city_names.dart';

class CitiesApiCall {
  CitiesApiCall({
    required this.name,
  });

  final String name;

  Map<String, dynamic> data = {};
  List<CityName> citiesNames = [];

  Future<void> callAPI() async {
    String cityNameQuery =
        "https://geocoding-api.open-meteo.com/v1/search?name=$name&count=10&language=en&format=json";

    // pass the url
    final url = Uri.parse(cityNameQuery);

    // get the responce
    final responce = await http.get(url);

    // decode the data
    data = jsonDecode(responce.body);

    // check if it contains results or not
    if (!data.keys.contains("results")) {
      // if not then return
      return;
    }

    // else we will now filter out the data

    List<dynamic> results = data["results"];

    for (int i = 0; i < results.length; i++) {
      Map<String, dynamic> tempData = results[i];
      double latitude = tempData["latitude"];
      double longitude = tempData["longitude"];
      String cityName = tempData["name"];
      String country = tempData["country"];
      String admins = "";

      if (tempData.keys.contains("admin1")) {
        admins = "${tempData["admin1"]}";
      }
      if (tempData.keys.contains("admin2")) {
        admins = "${tempData["admin2"]}, $admins";
      }
      if (tempData.keys.contains("admin3")) {
        admins = "${tempData["admin3"]}, $admins";
      }
      if (tempData.keys.contains("admin4")) {
        admins = "${tempData["admin4"]}, $admins";
      }

      admins = admins.trim();
      if (admins.endsWith(",")) {
        admins = admins.substring(0, admins.length - 1);
      }

      citiesNames.add(
        CityName(
          cityName: cityName,
          country: country,
          admins: admins,
          latitude: latitude,
          longitude: longitude,
        ),
      );
    }
  }

  List<CityName> getData() {
    return citiesNames;
  }
}
