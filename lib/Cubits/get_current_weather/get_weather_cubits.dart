import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_current_weather/get_weather_states.dart';
import 'package:weather_app/Models/weathe_model.dart';
import 'package:weather_app/Services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;

  // We know that cubit do two something first is managing the states and done the hold the logic and this is the method logic
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);

      emit(
          WeatherLoadedState(weatherModel: weatherModel!)); // send to the suitable state (request successful)
    } catch (e) {
      emit(
          WeatherFailureState()); // send to the suitable state (request failure)
    }
  }
}
