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
    // TODO: implement build
    return MaterialApp(
      home: CounterState(),
    );
  }

}

class CounterState extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<CounterState>{
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text("Counter"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
<<<<<<< HEAD
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
=======
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
>>>>>>> 391549f470a2e3f6d44564e55bd5244142f57c42
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}