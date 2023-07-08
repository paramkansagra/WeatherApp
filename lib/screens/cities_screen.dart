import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/cities_provider.dart';
import 'package:weather_app/screens/add_city_screen.dart';
import 'package:weather_app/widgets/cities_tiles.dart';
import 'package:weather_app/widgets/screen_devider.dart';

class CitiesScreen extends ConsumerStatefulWidget {
  const CitiesScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  final longitude, latitude, name;

  @override
  ConsumerState<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends ConsumerState<CitiesScreen> {
  List<CitiesTile> citiesList = [];

  @override
  Widget build(BuildContext context) {
    var cities = ref.watch(CitiesProvider.notifier).getCities();
    citiesList = cities
        .map(
          (item) => CitiesTile(
            latitude: item["latitude"],
            longitude: item["longitude"],
            name: item["name"],
            temprature: item["temprature"],
            weatherCode: item["weather_code"],
          ),
        )
        .toList();
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddCity(),
                ),
              );
            },
            icon: Icon(Icons.add_sharp),
          )
        ],
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
