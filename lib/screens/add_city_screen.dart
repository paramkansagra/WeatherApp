import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/add_city_tile.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  // Making a string to store the name of the city
  String cityName = "";

  // Making a form key to use the validator function any where
  final _formKey = GlobalKey<FormState>();

  // making a circular progress indiactor flag to show data is coming in
  bool circularProgressIndicatorFlag = false;

  // make a list of cities which we will get in the fetch call
  List<Map<dynamic, dynamic>> citiesList = [
    {
      "cityName": "Guwhati",
      "country": "India",
      "admins": "Assam",
      "latitude": 0.0,
      "longitude": 0.0,
    },
    {
      "cityName": "Jamnagar",
      "country": "India",
      "admins": "Jamnagar, Gujarat",
      "latitude": 0.0,
      "longitude": 0.0,
    },
    {
      "cityName": "Porbandar",
      "country": "India",
      "admins": "Porbandar, Gujarat",
      "latitude": 0.0,
      "longitude": 0.0,
    },
    {
      "cityName": "Motikhavdi",
      "country": "India",
      "admins": "Jamnagar, Gujarat",
      "latitude": 0.0,
      "longitude": 0.0,
    },
    {
      "cityName": "Chennai",
      "country": "India",
      "admins": "Tamil Nadu, Chennai",
      "latitude": 0.0,
      "longitude": 0.0,
    },
  ];

  // making a function to return list of cities which are coming in
  Widget listOfCities() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: citiesList.length,
          itemBuilder: (ctx, index) => AddCityTile(
            cityName: citiesList[index]["cityName"],
            country: citiesList[index]["country"],
            admins: citiesList[index]["admins"],
            latitude: citiesList[index]["latitude"],
            longitude: citiesList[index]["longitude"],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // creating a scaffold for the screen
    return Scaffold(
      // app bar for going back
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),

      // container for the body
      body: Container(
        // aligining it to center so that everything is centerized
        alignment: Alignment.center,

        // giving a padding for appearance
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),

        // column for the actual data
        child: Column(
          children: [
            // defining the text feild so that we get the city name
            TextFormField(
              key: _formKey,

              // giving the cursor the color
              cursorColor: Theme.of(context).colorScheme.onBackground,

              // giving the underline color
              decoration: InputDecoration(
                // hint text to add the city name
                hintText: "City",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),

                // giving a suffix icon to search the data and easing our work
                suffixIcon: IconButton(
                  // giving a search icon
                  icon: Icon(Icons.search_sharp),

                  // giving a on pressed function
                  onPressed: () {
                    // if the cityName is empty then give an error snack bar
                    if (cityName.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please Enter City Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }

                    // else we will be doing the api call
                    else {
                      setState(() {
                        circularProgressIndicatorFlag =
                            !circularProgressIndicatorFlag;
                      });
                    }
                  },
                ),
              ),

              // giving the input text a style
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),

              // on changed so that we can get the data from the text edit contoller
              onChanged: (value) => cityName = value,
            ),

            // adding a sizedbox for some spacing
            SizedBox(height: 10),

            //if the circular progress indiactor flag is true then we will show the indicator
            if (circularProgressIndicatorFlag)
              CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onBackground),
            if (!circularProgressIndicatorFlag) listOfCities(),
          ],
        ),
      ),
    );
  }
}
