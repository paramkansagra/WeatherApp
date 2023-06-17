import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AirQualityCompassWidget extends StatelessWidget {
  const AirQualityCompassWidget({
    super.key,
    required this.AirQuality,
  });

  final int AirQuality;

  @override
  Widget build(BuildContext context) {
    String airQualityTitle = "Excellent";
    int imageNumber = 1;
    if (AirQuality >= 0 && AirQuality <= 50) {
      airQualityTitle = "excellent";
      if (AirQuality <= 25) {
        imageNumber = 1;
      } else {
        imageNumber = 2;
      }
    } else if (AirQuality >= 51 && AirQuality <= 100) {
      airQualityTitle = "satisfactory";
      if (AirQuality <= 75) {
        imageNumber = 3;
      } else {
        imageNumber = 4;
      }
    } else if (AirQuality >= 101 && AirQuality <= 200) {
      airQualityTitle = "moderate";
      if (AirQuality <= 125) {
        imageNumber = 5;
      } else if (AirQuality <= 150) {
        imageNumber = 6;
      } else {
        imageNumber = 7;
      }
    } else if (AirQuality >= 201 && AirQuality <= 300) {
      airQualityTitle = "poor";
      imageNumber = 8;
    } else if (AirQuality >= 301 && AirQuality <= 400) {
      airQualityTitle = "very poor";
      imageNumber = 9;
    } else {
      airQualityTitle = "severe";
      imageNumber = 10;
    }

    return Container(
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "AIR QUALITY",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              airQualityTitle.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 25,
            ),
            SvgPicture.asset(
              "assets/AirQuality/$imageNumber.svg",
              height: 60,
              width: 60,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "$AirQuality",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            )
          ],
        ));
  }
}
