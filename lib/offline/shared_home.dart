import 'package:flutter/material.dart';
import 'package:myapp/offline/settings.dart';

class SharedHome extends StatefulWidget {
  @override
  _SharedHomeState createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPrefernce"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          )
        ],
      ),
      body: Center(child: Text("Counter is : $counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
