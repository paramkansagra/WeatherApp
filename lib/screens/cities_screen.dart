import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/api_provider.dart';
import 'package:weather_app/widgets/cities_tiles.dart';
import 'package:weather_app/widgets/screen_devider.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  final longitude, latitude, name;

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  var citiesList = [];

  @override
  void initState() {
    super.initState();
    citiesList = [
      CitiesTile(
        latitude: 13.09,
        longitude: 80.28,
        temprature: 20,
        name: "Chennai",
        weatherCode: "Sunny",
      ),
      CitiesTile(
        latitude: 22.47,
        longitude: 70.07,
        temprature: 20,
        name: "Jamnagar",
        weatherCode: "Sunny",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
          ),
          onPressed: () => Navigator.of(context).pop(
            [
              widget.longitude,
              widget.latitude,
              widget.name,
            ],
          ),
        ),
        title: Text(
          "LOCATIONS",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: "DotMatrix",
                fontSize: 30,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(1),
              ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: citiesList.length,
            itemBuilder: (cntx, index) => citiesList[index],
            padding: EdgeInsets.all(10),
            separatorBuilder: (cntx, index) => ScreenDevider(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
