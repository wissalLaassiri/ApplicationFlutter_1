import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/weather/weather.data.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String Keyword="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather"),backgroundColor: Colors.pinkAccent,),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a city name"
              ),
              style: TextStyle(fontSize: 25),
              onChanged: (value)=>setState(
                  (){
                    this.Keyword=value;
                  }) ,
              ),
            padding: EdgeInsets.all(10)
          ),

          Container(
            child: RaisedButton(
              onPressed: (){
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>WeatherData(keyword: this.Keyword,)
                  )
                );
              },
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(18),
              child: Text(
                "show Weather",
                style: TextStyle(
                  fontSize: 20,
                  color:Colors.white
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
