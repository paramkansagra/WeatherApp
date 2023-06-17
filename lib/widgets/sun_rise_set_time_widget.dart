import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weekly_weather.dart';

class SunRiseSetTimeWidget extends StatelessWidget {
  const SunRiseSetTimeWidget({super.key, required this.weeklyWeather});

  final WeeklyWeather weeklyWeather;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String time = weeklyWeather.sunrise;
    String asset = "assets/Sun/Sunrise.svg";
    String isSunRise = "sunrise";

    if (now.hour > int.parse(weeklyWeather.sunrise.substring(0, 1))) {
      time = weeklyWeather.sunset;
      asset = "assets/Sun/Sunset.svg";
      isSunRise = "sunset";
    }

    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isSunRise.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          SvgPicture.asset(
            asset,
            height: 97,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$time",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
