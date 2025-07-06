import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_current_weather/get_weather_cubits.dart';
import 'package:weather_app/Cubits/get_current_weather/get_weather_states.dart';
import 'package:weather_app/Views/Screens/no_weathe_screen.dart';
import 'package:weather_app/Views/Screens/weather_screen.dart';
import 'package:weather_app/Views/Screens/city_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubits(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<GetWeatherCubits, WeatherStates>(
            builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherScreen();
          } else if (state is WeatherLoadedState) {
            return WeatherScreen();
          } else {
            return Text("Ops,there are an error");
          }
        },
        ),
        // home: weatherModel == null ? NoWeatherScreen() : WeatherScreen(), // while using weatherModels as global variable
      ),
    );
  }
}
