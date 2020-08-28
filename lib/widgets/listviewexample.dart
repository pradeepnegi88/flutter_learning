import 'package:flutter/material.dart';

// There are four ways to create listview
//1. List (Good for small items, it creates objects )
//2.ListView.builder (Build children on demand inifinite, recycles the objects)
//3. Listview.separated (Fixed number of items and gives the facility of seperator view)
//4.ListView.custom (It takes silverchilddelegate control the algorithm used to estimate the size of the children taht are not actually visible)
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
  final List<String> entries = ["Box1", "Box2", "Box3", "Box4", "Box5"];
  final List<int> colorCodes = [100, 200, 300, 400, 700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Examples"),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          List.generate(
            100,
            (index) => Container(
              color: Colors.redAccent,
              height: 200,
              margin: EdgeInsets.only(bottom: 8),
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.cake,
                    size: 100,
                    color: Colors.white,
                  ),
                  title: Text("title $index"),
                  subtitle: Text("subtitle $index"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewSeparatedWidget extends StatelessWidget {
  const ListViewSeparatedWidget({
    Key key,
    @required this.colorCodes,
    @required this.entries,
  }) : super(key: key);

  final List<int> colorCodes;
  final List<String> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        height: 200,
        color: Colors.red[colorCodes[index]],
        child: Text(entries[index]),
      ),
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: entries.length,
    );
  }
}

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({
    Key key,
    @required this.colorCodes,
    @required this.entries,
  }) : super(key: key);

  final List<int> colorCodes;
  final List<String> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          color: Colors.red[colorCodes[index]],
          child: Text(entries[index]),
        );
      },
      itemCount: entries.length,
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
