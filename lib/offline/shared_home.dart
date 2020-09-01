import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/offline/settings.dart';
import 'package:path_provider/path_provider.dart';

class SharedHome extends StatefulWidget {
  @override
  _SharedHomeState createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  int counter;
  Future<String> getLocalPath() async {
    var dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> getLocalFile() async {
    String path = await getLocalPath();
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int c) async {
    File file = await getLocalFile();
    return file.writeAsString('$c');
  }

  Future<int> readCounter() async {
    try {
      File file = await getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    readCounter().then((value) {
      setState(() {
        counter = value;
      });
    });
  }

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
          writeCounter(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
