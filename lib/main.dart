import 'package:flutter/material.dart';
import 'package:weather_app/Views/Screens/no_weathe_screen.dart';
import 'package:weather_app/Views/Screens/weather_screen.dart';
import 'package:weather_app/Views/Screens/city_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CitySearchScreen(),
    );
  }
}
