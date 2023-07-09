import 'package:flutter/material.dart';

class AddCityTile extends StatelessWidget {
  const AddCityTile({
    super.key,
    required this.cityName,
    required this.country,
    required this.admins,
    required this.latitude,
    required this.longitude,
  });

  final String cityName;
  final String country;
  final String admins;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$cityName",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 25,
              letterSpacing: 2,
            ),
      ),
      subtitle: Text(
        "$admins, $country",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w200,
              letterSpacing: 2,
            ),
      ),
      onTap: () {
        Navigator.of(context).pop([longitude, latitude, cityName]);
      },
    );
  }
}
