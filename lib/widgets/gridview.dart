import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
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
  final List<String> entries = ["Box1", "Box2", "Box3", "Box4", "Box5"];
  final List<int> colorCodes = [100, 200, 300, 400, 700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Examples"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        scrollDirection: Axis.vertical,
        children: List.generate(
            100,
            (index) => Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("Item $index"),
                  ),
                )),
      ),
    );
  }
}
