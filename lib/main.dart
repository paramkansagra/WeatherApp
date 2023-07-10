// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// screens imports
import 'package:weather_app/screens/weather_screen.dart';

void main() {
  runApp(app());
}

Widget app() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProviderScope(
      child: WeatherScreen(
        latitude: 26.18,
        longitude: 91.75,
      ),
    ),
    theme: ThemeData.from(
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        displayLarge: TextStyle(
          fontSize: 45,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      useMaterial3: true,
    ),
  );
}
