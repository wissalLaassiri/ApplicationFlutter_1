import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first_app/widgets/drawer.widget.dart';
import 'package:http/http.dart' as http;
class GitRepoPage extends StatefulWidget {
  String login;
  String avatar;
  GitRepoPage({this.login,this.avatar});

  @override
  _GitRepoPageState createState() => _GitRepoPageState();
}

class _GitRepoPageState extends State<GitRepoPage> {
  dynamic dataRepositories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }
  void loadRepositories() async{
    String url = "https://api.github.com/users/${widget.login}/repos";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        dataRepositories = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("${widget.login}"),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar),
          )
        ],
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context,index)=> ListTile(
              title : Text("${dataRepositories[index]['name']}"),
            ),
            separatorBuilder: (context,index) =>Divider(
              height: 2,
              color : Colors.red
            ),
            itemCount: dataRepositories==null?0:dataRepositories.length
        )
      ),
    );
  }

}
