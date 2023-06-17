import 'package:flutter/material.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({super.key, required this.humidity});

  final humidity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Humidity".toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 56,
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              child: CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.background.withOpacity(0.8),
                radius: 55,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  radius: (humidity / 100) * 55,
                ),
              ),
            ),
          ),
          Text(
            "$humidity%",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }
}
