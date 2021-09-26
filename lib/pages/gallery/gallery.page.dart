import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/gallery/gallery.data.dart';
import 'package:http/http.dart' as http;

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String Keyword="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Gallery") ,backgroundColor: Colors.purpleAccent,),
      body:Column(
        children: <Widget> [
         Container(
           child: TextField(
             style: TextStyle(fontSize: 25),
             onChanged: (value)=> setState((){
               this.Keyword = value;
             }),
           ),
           padding: EdgeInsets.all(10),
         ),
         // ignore: deprecated_member_use
         Container(
             child:
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>GalleryData(keyword: this.Keyword,))
                  );
                },
                color: Colors.purpleAccent,
                padding: EdgeInsets.all(20),
                child: Text("Get Image",
                    style: TextStyle(fontSize: 20)),
             )
         ),
        ],
      )
    );
  }
}
