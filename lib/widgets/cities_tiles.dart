import 'package:flutter/material.dart';

class CitiesTile extends StatelessWidget {
  const CitiesTile({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.temprature,
    required this.weatherCode,
  });

  final latitude, longitude, name, temprature, weatherCode;
  final String add = "\u00B0";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$name  $temprature$add",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 25,
              letterSpacing: 2,
            ),
      ),
      subtitle: Text(
        "$weatherCode",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w200,
              letterSpacing: 2,
            ),
      ),
      onTap: () {
        Navigator.of(context).pop([longitude, latitude, name]);
      },
    );
  }
}
