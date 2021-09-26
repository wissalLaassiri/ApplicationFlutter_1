import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherData extends StatefulWidget {
  String keyword;

  @override
  _State createState() => _State();

  WeatherData({this.keyword});
}

class _State extends State<WeatherData> {
  var weather;
  List<dynamic> detail = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  getData() {
    String url =
        "https://samples.openweathermap.org/data/2.5/forecast?q=${widget.keyword}&appid=6f29d928021279fd3cf91e0bf852795b";
    print(url);
    http.get(Uri.parse(url)).then((result) {
      setState(() {
        weather = json.decode(result.body)['list'];
        print(weather);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather of ${widget.keyword}"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: weather == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: weather == null ? 0 : weather.length,
              itemBuilder: (context, index) {
                return  Row(
                  children:
                  <Widget>[
                    Container(
                      child:
                      CircleAvatar(
                        backgroundImage: NetworkImage("https://openweathermap.org/img/w/${weather[index]['weather'][0]['icon']}.png"),
                        backgroundColor: Colors.pink,
                        radius: 30,
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child:
                      Card(
                        child:Padding(
                            padding: EdgeInsets.only(left:10,right: 10),
                            child:  Center(
                              child: Text("${new DateFormat('E dd/mm/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weather[index]['dt'] * 1000000))}",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              ),
                            )
                        ),
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

/**
 * Container(
    width: double.infinity,
    padding: EdgeInsets.all(10),
    child: Card(
    child: Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Center(
    child: Text(
    "${weather[index]['main']['temp']}",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white),
    ),
    )),
    color: Colors.pinkAccent,
    ),
    ),
 */
