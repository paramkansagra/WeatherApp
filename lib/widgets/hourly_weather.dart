import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/daily_weather.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({
    super.key,
    required this.dailyWeather,
  });

  final String add = "\u00B0";
  final DailyWeather dailyWeather;

  @override
  Widget build(BuildContext context) {
    String image = "";

    if (dailyWeather.isDay == 1) {
      image = dailyWeather.weatherCode;
    } else {
      if (dailyWeather.weatherCode == "assets/images/Clouds.svg") {
        image = "assets/images/CloudyNight.svg";
      }
      if (dailyWeather.weatherCode == "assets/images/Sunny.svg") {
        image = "assets/images/NightClear.svg";
      }
      if (dailyWeather.weatherCode == "assets/images/Overcast.svg") {
        image = "assets/images/NightOvercast.svg";
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Text(
            dailyWeather.time,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white.withOpacity(0.32),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 18,
                  height: 18,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "${dailyWeather.temprature}$add",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
