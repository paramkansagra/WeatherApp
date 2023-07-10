import 'package:flutter/material.dart';
import 'package:weather_app/widgets/screen_devider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.celcius, required this.wind});

  final celcius, wind;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool celcius = true, wind = true;

  @override
  void initState() {
    super.initState();
    celcius = widget.celcius;
    wind = widget.wind;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop([celcius, wind]);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                groupValue: celcius,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                activeColor: Theme.of(context).colorScheme.onBackground,
                onChanged: (value) {
                  celcius = true;
                  if (mounted) setState(() {});
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
                groupValue: celcius,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                activeColor: Theme.of(context).colorScheme.onBackground,
                onChanged: (value) {
                  celcius = false;
                  if (mounted) setState(() {});
                },
                title: Text(
                  "Fahrenhite",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              ScreenDevider(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
              ),
              Text(
                "WIND SPEED",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: true,
                groupValue: wind,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                activeColor: Theme.of(context).colorScheme.onBackground,
                onChanged: (value) {
                  wind = true;
                  if (mounted) setState(() {});
                },
                title: Text(
                  "KM/H",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              RadioListTile(
                value: false,
                groupValue: wind,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                activeColor: Theme.of(context).colorScheme.onBackground,
                onChanged: (value) {
                  wind = false;
                  if (mounted) setState(() {});
                },
                title: Text(
                  "MPH",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              ScreenDevider(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Made with ❤️ by Param Kansagra",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.8),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
