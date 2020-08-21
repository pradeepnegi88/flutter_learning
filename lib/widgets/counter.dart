import 'package:flutter/material.dart';

class CounterLabel extends StatelessWidget {
  final int counter;
  CounterLabel(this.counter);
  @override
  Widget build(BuildContext context) {
    return Text('Counter is : $counter');
  }
}

class CounterButton extends StatelessWidget {
  final VoidCallback callback;
  CounterButton(this.callback);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: callback,
      child: Text("Increment"),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade300,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: Column(children: [
          CounterLabel(_counter),
          CounterButton(increment),
        ]),
      ),
    );
  }
}
