import 'package:flutter/material.dart';
import 'package:flutter_first_app/widgets/drawer.widget.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(title:Text("Home"),),
      body: Center(
        child: Text("Im in Home"),
      ),
    );
  }
}
