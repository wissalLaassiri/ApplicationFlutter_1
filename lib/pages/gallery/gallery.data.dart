import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryData extends StatefulWidget {
  String keyword="";
  GalleryData({this.keyword});
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  int currentPage = 0;
  int totalPage = 0;
  int pageSize = 5;//number of results per page
  ScrollController scrollController = new ScrollController();
  List<dynamic> hits ;
  var galleryData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage < totalPage-1) {
            ++currentPage;
            getData();
          }
        });
      }
    });
  }


  void getData(){
    String url = "https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyword}&page=$currentPage&per_page=$pageSize";
    http.get(Uri.parse(url))
        .then((response) {
      setState(() {
        galleryData = json.decode(response.body);
        hits = galleryData['hits'];
        print(hits);
      });
    }
    ).catchError((err){
      print("Errroooor $err");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.keyword}"),),
      body: (galleryData==null?Text("not"):
        ListView.builder(
          itemCount: (galleryData==null?0:hits.length),
          itemBuilder:(context,index){
            return Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Padding(padding: EdgeInsets.all(10),
                      child: Text(
                        hits[index]['tags'],
                        style: TextStyle(fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Card(
                    child:
                      Image.network(hits[index]['webformatURL']),
                  ),
                )
              ],
            );
          },
        )
      ),
    );
  }
}
