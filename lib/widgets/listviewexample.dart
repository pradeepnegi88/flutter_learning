import 'package:flutter/material.dart';

// There are four ways to create listview
//1. List (Good for small items, it creates objects )
//2.ListView.builder
//3. Listview.separated
//4.ListView.custom
class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Examples"),
      ),
      body: NormalList(),
    );
  }
}

class NormalList extends StatelessWidget {
  const NormalList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(color: Colors.blueGrey, height: 200, child: Text("Box 1")),
      Container(color: Colors.green, height: 200, child: Text("Box 2")),
      Container(color: Colors.yellow, height: 200, child: Text("Box 3")),
      Container(color: Colors.blue, height: 200, child: Text("Box 4")),
      Container(color: Colors.pink, height: 200, child: Text("Box 5")),
      Container(color: Colors.red, height: 200, child: Text("Box 6"))
    ]);
  }
}
