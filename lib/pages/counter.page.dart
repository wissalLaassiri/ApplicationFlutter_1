import 'package:flutter/material.dart';
import 'package:flutter_first_app/widgets/drawer.widget.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(title:Text("Counter"),),
      body: Center(
        child: Text("I'm in Counter $counter")),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
                  setState((){
                    counter--;
                  }
                  );
              },
            ),
            SizedBox(width: 6,),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                setState((){
                  counter++;
                }
                );
              },
            ),
          ],
        ),

    );
  }
}
