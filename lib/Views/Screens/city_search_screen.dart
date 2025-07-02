import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Models/weathe_model.dart';
import 'package:weather_app/Services/weather_service.dart';

class CitySearchScreen extends StatelessWidget {
  const CitySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade600,
        title: Text(
          "Search a City ",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            // can replace it with IconButton
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: TextField(
            onSubmitted: (value) async {
              // onSubmitted to apply the search after all input (when click enter) not after each character that use onChanged
              WeatherModel weatherModel = await WeatherServices(Dio())
                  .getCurrentWeather(cityName: value);
              // to print the previous line into the app i will put it into model and show it from log function , and convert onSubmitted method to async method
              log(weatherModel.city);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.shade600),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.shade600),
              ),
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              floatingLabelStyle: TextStyle(color: Colors.amber.shade600),
              contentPadding: EdgeInsets.symmetric(
                vertical: 28,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
