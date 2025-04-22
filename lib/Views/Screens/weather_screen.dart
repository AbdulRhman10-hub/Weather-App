import 'package:flutter/material.dart';
import 'package:weather_app/Views/Widgets/custom_app_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text("Alexandria",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("updated at 23:46",style: TextStyle(fontSize: 14),),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Image.asset('assets/images/download.png',height: 50,width: 50,),
                        Spacer(),
                        Text("17",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Column(
                          children: [
                    Text("MaxTemp: 24",style: TextStyle(fontSize: 10),),
                    Text("MinTemp: 16",style: TextStyle(fontSize: 10),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text("Ligh Rain ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                
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