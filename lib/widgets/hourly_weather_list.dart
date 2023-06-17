import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/api_provider.dart';
import 'package:weather_app/widgets/hourly_weather.dart';

class HourlyWeatherList extends ConsumerWidget {
  const HourlyWeatherList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<dynamic> dailyWeatherList =
        ref.read(ApiProvider.notifier).dailyData;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...dailyWeatherList.map(
            (e) => HourlyWeather(dailyWeather: e),
          ),
        ]),
      ),
    );
  }
}
