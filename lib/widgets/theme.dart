import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tabs",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          accentColor: Colors.blue.shade200,
          iconTheme: IconThemeData(size: 300, color: Colors.black),
          textTheme: TextTheme(headline1: TextStyle(fontSize: 50))),
      home: TabController(),
    );
  }
}

class TabController extends StatelessWidget {
  const TabController({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter tabs"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bus)),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(
              child: Column(
            children: [
              Icon(Icons.directions_bike),
              SizedBox(height: 10),
              Text(
                "Flutter Text",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          )),
          Center(child: Icon(Icons.directions_car)),
          Center(child: Icon(Icons.directions_bus)),
        ]),
        floatingActionButton: Theme(
            data: ThemeData(iconTheme: IconThemeData(size: 20)),
            child:
                FloatingActionButton(onPressed: () {}, child: Icon(Icons.add))),
      ),
    );
  }
}
