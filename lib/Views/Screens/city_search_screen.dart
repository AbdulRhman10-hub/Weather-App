import 'package:flutter/material.dart';

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
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.amber.shade600 ),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.amber.shade600),),
                hintText: "Enter City Name",
                suffixIcon: Icon(Icons.search),
                labelText: 'Search',
                floatingLabelStyle: TextStyle(color:Colors.amber.shade600),
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
