import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weather_code.dart';

class CitiesTile extends StatelessWidget {
  const CitiesTile({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.temprature,
    required this.weatherCode,
  });

  final latitude, longitude, name, temprature, weatherCode;
  final String add = "\u00B0";

  @override
  Widget build(BuildContext context) {
    var weather = WeatherCodeText[weatherCode];

    return ListTile(
      title: Text(
        "$name  $temprature$add",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 25,
              letterSpacing: 2,
            ),
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset(
            WeatherCodeImage[weatherCode]!,
            height: MediaQuery.of(context).size.height * 0.025,
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "$weather",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pop([longitude, latitude, name]);
      },
    );
  }
}
