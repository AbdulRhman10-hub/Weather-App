import 'package:flutter/material.dart';
import 'package:weather_app/Views/Screens/city_search_screen.dart';

class CustomAppBar extends StatelessWidget {
  final IconData? icon;
  const CustomAppBar({
    super.key, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        'Weather',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CitySearchScreen()));
            },
            child: Icon(
              icon,
              color: Colors.white,
            )),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
