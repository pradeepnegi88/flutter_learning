import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tabs",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        canvasColor: Colors.black.withAlpha(60),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter tabs"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_bike, color: Colors.white)),
                Tab(icon: Icon(Icons.directions_car, color: Colors.white)),
                Tab(icon: Icon(Icons.directions_bus, color: Colors.white)),
              ],
            ),
          ),
          body: TabBarView(children: [
            Center(child: Icon(Icons.directions_bike, color: Colors.white)),
            Center(child: Icon(Icons.directions_car, color: Colors.white)),
            Center(child: Icon(Icons.directions_bus, color: Colors.white)),
          ]),
        ),
      ),
    );
  }
}
