import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/api_provider.dart';
import 'package:weather_app/widgets/daily_weather.dart';

class DailyWeatherList extends ConsumerWidget {
  const DailyWeatherList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<dynamic> weeklyWeatherList =
        ref.read(ApiProvider.notifier).weeklyData;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            ...weeklyWeatherList.map((e) => DailyWeather(weeklyWeather: e)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
