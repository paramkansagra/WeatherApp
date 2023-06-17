import 'package:flutter/material.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({super.key, required this.airQuality});

  final int airQuality;

  @override
  Widget build(BuildContext context) {
    String airQualityTitle = "Moderate";
    if (airQuality >= 0 && airQuality <= 50) {
      airQualityTitle = "excellent";
    } else if (airQuality >= 51 && airQuality <= 100) {
      airQualityTitle = "satisfactory";
    } else if (airQuality >= 101 && airQuality <= 200) {
      airQualityTitle = "moderate";
    } else if (airQuality >= 201 && airQuality <= 300) {
      airQualityTitle = "poor";
    } else if (airQuality >= 301 && airQuality <= 400) {
      airQualityTitle = "very poor";
    } else {
      airQualityTitle = "severe";
    }

    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2 - 10,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(50),
              right: Radius.circular(50),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AIR QUALITY $airQuality",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  Text(
                    "${airQualityTitle.toUpperCase()}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
