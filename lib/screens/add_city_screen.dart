import 'dart:developer';

import 'package:flutter/material.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  // defining a controller to get the value out of the text box
  final textEditController = TextEditingController();

  // making a dispose function to dispose off the text edit contoller
  @override
  void dispose() {
    // disposing off the text edit contoller
    textEditController.dispose();
    // going to the upper dispose
    super.dispose();
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

            TextField(
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
              ),

              // giving the input text a style
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),

              // giving the text feild the controller
              controller: textEditController,

              // on changed so that we can get the data from the text edit contoller
              onChanged: (value) => log(textEditController.text),
            ),
          ],
        ),
      ),
    );
  }
}
