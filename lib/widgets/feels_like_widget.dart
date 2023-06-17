import 'package:flutter/material.dart';

class FeelsLikeCircle extends StatelessWidget {
  const FeelsLikeCircle({
    super.key,
    required this.temprature,
  });

  final int temprature;
  final String add = "\u00B0";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: temprature < 40
            ? Theme.of(context).colorScheme.onBackground
            : Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "FEELS LIKE",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: temprature < 40
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              "$temprature$add",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 50,
                    color: temprature < 40
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
