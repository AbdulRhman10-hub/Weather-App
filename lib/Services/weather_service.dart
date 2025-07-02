import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/weathe_model.dart';

class WeatherServices {
  final Dio dio;

  WeatherServices(this.dio);
  final String baseUrl =
      'http://api.weatherapi.com/v1'; // protcol (http) + domain(api.weatherapi.com) + path(v1)    , all text before the method name is baseUrl
  final String apiKey = 'd509a240fc934cf88b3132141252806'; // apiKey

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
                   // *****if sucess response ******//
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
                   //******** error ( response error ) from your url or statusCode not 200  *******//

      // final String errorMessage = e.response.data['error']['message'];// but if the response (e.response) is null not error so we need to add something for null response so we will add null check operator for this
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there are an error , try later';
      throw Exception(errorMessage);
    } catch (e) {
                    //  *******  any other unexcepected error  **********   //
      log(e.toString()); // to show the error message for me
      throw Exception('Oops, there are an error , try later');
    }
  }
}
