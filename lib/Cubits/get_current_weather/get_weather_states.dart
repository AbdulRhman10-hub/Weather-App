// Class for each state in UI (state => change in UI)
import 'package:weather_app/Models/weathe_model.dart';

class WeatherStates {} // public class to pass it to cubit to can use other classes from it

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
   final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {}

class ThemeColorState extends WeatherStates {}
