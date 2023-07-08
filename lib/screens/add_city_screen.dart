import 'dart:developer';

import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
