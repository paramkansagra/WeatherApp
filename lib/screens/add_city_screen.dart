import 'package:flutter/material.dart';
import 'package:weather_app/api/cities_list_api_call.dart';
import 'package:weather_app/models/city_names.dart';
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
  List<CityName> citiesList = [];

  // making a function to return list of cities which are coming in
  Widget listOfCities() {
    if (citiesList.length > 0)
      return Expanded(
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: citiesList.length,
            itemBuilder: (ctx, index) => AddCityTile(
              cityName: citiesList[index].cityName,
              country: citiesList[index].country,
              admins: citiesList[index].admins,
              latitude: citiesList[index].latitude,
              longitude: citiesList[index].longitude,
            ),
          ),
        ),
      );
    else {
      return Expanded(
        child: Text(
          "No such city avaliable",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 25,
                letterSpacing: 2,
              ),
        ),
      );
    }
  }

  void ShowSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        duration: Duration(seconds: 2),
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

              // setting the auto focus as true
              autofocus: true,

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

                  disabledColor: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.8),

                  // giving a on pressed function
                  // if the ciruclar progress indicator is true we will disable the search button
                  onPressed: circularProgressIndicatorFlag
                      ? null
                      : () async {
                          // if the cityName is empty then give an error snack bar
                          if (cityName.trim().isEmpty) {
                            ShowSnackBar("Please Enter City Name");
                          }

                          // if the lenght of city name is less than 2
                          else if (cityName.trim().length <= 2) {
                            ShowSnackBar("Please give a longer name");
                          }

                          // else we will be doing the api call
                          else {
                            // set the circular progress bar as true and make the api cal
                            setState(
                              () {
                                circularProgressIndicatorFlag = true;
                              },
                            );

                            // removing the keyboard from focus
                            FocusManager.instance.primaryFocus?.unfocus();

                            // make the api call and store the data in the cities list
                            var apiObj = CitiesApiCall(name: cityName);
                            await apiObj.callAPI();
                            citiesList = apiObj.getData();

                            // after storing data in cities list now show the list
                            setState(
                              () {
                                circularProgressIndicatorFlag = false;
                              },
                            );
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
            Container(
              child: circularProgressIndicatorFlag
                  ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onBackground)
                  : listOfCities(),
            ),
          ],
        ),
      ),
    );
  }
}
