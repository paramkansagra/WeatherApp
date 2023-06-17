import 'package:flutter/material.dart';

class MainTempratureCircle extends StatelessWidget {
  const MainTempratureCircle({
    super.key,
    required this.temprature,
    required this.tempratureHigh,
    required this.tempratureLow,
  });

  final int temprature;
  final int tempratureHigh;
  final int tempratureLow;
  final String add = "\u00B0";

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.05,
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$temprature$add",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 75,
                  fontWeight: FontWeight.w300,
                ),
          ),
          Text(
            "H:$tempratureHigh$add L:$tempratureLow$add",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
