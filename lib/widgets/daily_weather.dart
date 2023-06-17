import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weekly_weather.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({
    super.key,
    required this.weeklyWeather,
  });

  final WeeklyWeather weeklyWeather;
  final String add = "\u00B0";

  @override
  Widget build(BuildContext context) {
    String day = "Today";
    if (weeklyWeather.day == 7) day = "Sun";
    if (weeklyWeather.day == 1) day = "Mon";
    if (weeklyWeather.day == 2) day = "Teus";
    if (weeklyWeather.day == 3) day = "Wed";
    if (weeklyWeather.day == 4) day = "Thru";
    if (weeklyWeather.day == 5) day = "Fri";
    if (weeklyWeather.day == 6) day = "Sat";

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Text(
            day.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          SvgPicture.asset(
            weeklyWeather.weatherCode,
            height: 25,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            "${weeklyWeather.tempratureMax}$add",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "${weeklyWeather.tempratureMin}$add",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
