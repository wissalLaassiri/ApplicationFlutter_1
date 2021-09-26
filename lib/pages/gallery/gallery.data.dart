import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryData extends StatefulWidget {
  String keyword;
  GalleryData({this.keyword});
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  int currentPage=1;
  int sizePerPage = 6;
  List<dynamic> hits=[];
  var galleryData;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

 getData(){
  String url = "https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyword}&page=${currentPage}&per_page=${sizePerPage}";
  print(url);
  http.get(Uri.parse(url)).then((result) {
   setState(() {
     galleryData=json.decode(result.body);
     hits= galleryData['hits'];
     print(hits);
   });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.keyword}",style: TextStyle(fontSize: 20),),),
      body: (galleryData==null?CircularProgressIndicator():
          ListView.builder(
              itemCount: (galleryData==null?0:hits.length),
              itemBuilder:(context,index){
                return Column(
                  children: <Widget>[
                    Container(
                      width:double.infinity,
                      padding: EdgeInsets.all(10),
                      child:
                        Card(
                          child:Padding(
                            padding: EdgeInsets.only(left:10,right: 10),
                            child:  Center(
                              child: Text(hits[index]['tags'],style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              ),
                            )
                          ),
                          color: Colors.pinkAccent,
                        ),
                    ),
                    Container(
                      child: Card(
                        child: Image.network(hits[index]['webformatURL'],
                        fit: BoxFit.fitWidth,)
                      ),
                      padding: EdgeInsets.only(left:10,right: 10),
                    )
                  ],
                );
              }
          )
      )
    );
  }
}
