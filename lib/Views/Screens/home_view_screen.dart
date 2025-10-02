import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_current_weather/get_weather_cubits.dart';
import 'package:weather_app/Cubits/get_current_weather/get_weather_states.dart';
import 'package:weather_app/Views/Screens/city_search_screen.dart';
import 'package:weather_app/Views/Screens/no_weathe_screen.dart';
import 'package:weather_app/Views/Screens/weather_screen.dart';
import 'package:weather_app/main.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getWeatherColor(
          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.state,
        ),
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CitySearchScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherScreen();
          } else if (state is WeatherLoadedState) {
            return WeatherScreen(
              weather: state.weatherModel,
            );
          } else {
            return const Center(child: Text("Oops,there are an error"));
          }
        },
      ),
      // body: weatherModel == null ? NoWeatherScreen() : WeatherScreen(), // while using weatherModels as global variable
    );
  }
}
