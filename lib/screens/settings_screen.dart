import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.celcius});

  final celcius;

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
          children: [
            Text(
              "SETTINGS",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    fontFamily: "DotMatrix",
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
