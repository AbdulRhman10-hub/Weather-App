class WeatherModel {
  final String city;
  final String date;
  final double temp;     // not String but double
  final double maxTemp;  // not String but double
  final double minTemp;  // not String but double
  final String state;
  final String image;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.temp,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.state});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      state: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
