// Class for each state in UI (state => change in UI)
class WeatherStates {} // public class to pass it to cubit to can use other classes from it

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {}

class WeatherFailureState extends WeatherStates {}
