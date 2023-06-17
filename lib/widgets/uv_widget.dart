import 'package:flutter/material.dart';

class UvWidget extends StatelessWidget {
  const UvWidget({super.key, required this.uvIndex});

  final int uvIndex;

  @override
  Widget build(BuildContext context) {
    String levelOfUV = "Low";

    if (uvIndex <= 2) {
      levelOfUV = "low";
    } else if (uvIndex <= 5) {
      levelOfUV = "Moderate";
    } else if (uvIndex <= 7) {
      levelOfUV = "High";
    } else if (uvIndex <= 10) {
      levelOfUV = "Very High";
    } else {
      levelOfUV = "Exteme";
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
                    "UV INDEX $uvIndex",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  Text(
                    levelOfUV.toUpperCase(),
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
