import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/weekly_weather.dart';
import 'package:weather_app/providers/api_provider.dart';
import 'package:weather_app/screens/settings_screen.dart';
import 'package:weather_app/widgets/air_quality_compass_widget.dart';
import 'package:weather_app/widgets/air_quality_widget.dart';
import 'package:weather_app/widgets/daily_weather_list.dart';
import 'package:weather_app/widgets/feels_like_widget.dart';
import 'package:weather_app/widgets/hourly_weather_list.dart';
import 'package:weather_app/widgets/humidity_widget.dart';
import 'package:weather_app/widgets/main_temprature_circle.dart';
import 'package:weather_app/widgets/screen_devider.dart';
import 'package:weather_app/widgets/sun_rise_set_time_widget.dart';
import 'package:weather_app/widgets/uv_circle_widget.dart';
import 'package:weather_app/widgets/uv_widget.dart';
import 'package:weather_app/widgets/windspeed_widget.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen(
      {super.key, required this.latitude, required this.longitude});

  final latitude, longitude;

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final String title = "guwahati";
  final String add = "\u00B0";

  SizedBox paddingBetween() {
    return SizedBox(
      height: 10,
    );
  }

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        ref
            .watch(ApiProvider.notifier)
            .setPoints(widget.longitude, widget.latitude);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(ApiProvider.notifier).getWeather();

    ref.listen(
      ApiProvider,
      (previous, next) {
        if (previous.toString() != next.toString()) {
          setState(() {
            log("previous ---->  " + previous.toString());
            log("next ---->  " + next.toString());
          });
        }
      },
    );

    // we are having dummy data till we load the correct data
    DailyWeather currentData = DailyWeather(
      time: "00:00",
      temprature: 35,
      apparentTemperature: 40,
      humidity: 70,
      weatherCode: "assets/images/Sunny.svg",
      windSpeed: 0,
      windDirection: 0,
      uvIndex: 4,
      isDay: 1,
      aqi: 10,
    );

    //dummy data for the sunrise and sunset and all
    WeeklyWeather weeklyWeather = WeeklyWeather(
      day: 1,
      tempratureMax: 10,
      tempratureMin: 20,
      weatherCode: "assets/images/Sunny.svg",
      sunrise: "10:10",
      sunset: "10:10",
    );

    if (ref.read(ApiProvider.notifier).dailyData.length != 0) {
      currentData = ref.read(ApiProvider.notifier).dailyData[0];
      weeklyWeather = ref.read(ApiProvider.notifier).weeklyData[0];
    }

    return Scaffold(
      // defining the app bar
      appBar: AppBar(
        // the usual colors given in for the background
        backgroundColor: Theme.of(context).colorScheme.background,

        // giving the title of the app bar
        title: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: "DotMatrix",
                fontSize: 30,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(1),
              ),
        ),
        centerTitle: true,

        // giving a trailing icon for settings
        actions: [
          IconButton(
            onPressed: () async {
              bool temp = ref.read(ApiProvider.notifier).getTempUnit();
              var isCelcius = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => SettingsScreen(celcius: temp),
                ),
              );
              log("$isCelcius");
              await ref.watch(ApiProvider.notifier).changeTempUnit(isCelcius);
              setState(() {});
            },
            icon: const Icon(
              Icons.settings_outlined,
            ),
          )
        ],

        // giving a leading icon for the cities to be used
        leading: IconButton(
          icon: const Icon(
            Icons.view_list_outlined,
          ),
          onPressed: () {},
        ),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // first row ka code
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // main temprature circle
                  MainTempratureCircle(
                    temprature: currentData.temprature,
                    tempratureHigh: weeklyWeather.tempratureMax,
                    tempratureLow: weeklyWeather.tempratureMin,
                  ),

                  // Air Quality and uv index widgets
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      AirQuality(airQuality: currentData.aqi),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      UvWidget(uvIndex: currentData.uvIndex),
                    ],
                  ),
                ],
              ),

              // padding
              paddingBetween(),

              // screen devider
              const ScreenDevider(),

              paddingBetween(),

              // hourly weather list
              HourlyWeatherList(),

              paddingBetween(),

              DailyWeatherList(),

              paddingBetween(),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  AirQualityCompassWidget(AirQuality: currentData.aqi),
                  HumidityWidget(humidity: currentData.humidity),
                ],
              ),

              paddingBetween(),

              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  WindSpeedWidget(
                      speed: currentData.windSpeed,
                      direction: currentData.windDirection),
                  UVCircleWidget(uvIndex: currentData.uvIndex),
                ],
              ),

              paddingBetween(),

              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SunRiseSetTimeWidget(weeklyWeather: weeklyWeather),
                  FeelsLikeCircle(temprature: currentData.apparentTemperature),
                ],
              ),

              paddingBetween(),
            ],
          ),
        ),
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
