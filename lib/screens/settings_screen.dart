import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key, required this.celcius});

  bool celcius;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop(widget.celcius);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SETTINGS",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    fontFamily: "DotMatrix",
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "UNITS",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              value: true,
              groupValue: widget.celcius,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              activeColor: Theme.of(context).colorScheme.onBackground,
              onChanged: (value) {
                widget.celcius = true;
                setState(() {});
              },
              title: Text(
                "Celcius",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            RadioListTile(
              value: false,
              groupValue: widget.celcius,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              activeColor: Theme.of(context).colorScheme.onBackground,
              onChanged: (value) {
                widget.celcius = false;
                setState(() {});
              },
              title: Text(
                "Fahrenhite",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
