import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_current_weather/get_weather_cubits.dart';
import 'package:weather_app/Views/Widgets/custom_app_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
  var weatherModel = BlocProvider.of<GetWeatherCubits>(context).weatherModel;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(weatherModel.city,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}",style: TextStyle(fontSize: 14),),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Image.network("https:${weatherModel.image}",height: 50,width: 50,),  // looking at the error we found that the error because the url have not (https:)
                        Spacer(),
                        Text("${weatherModel.temp}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Column(
                          children: [
                    Text("Maxtemp: ${weatherModel.maxTemp.round()}",style: TextStyle(fontSize: 10),), // round for the earlest number ex: 12.2 => 12 and 12.8 => 13
                    Text("Mintemp: ${weatherModel.minTemp.round()}",style: TextStyle(fontSize: 10),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(weatherModel.state,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}