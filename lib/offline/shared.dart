import 'package:flutter/material.dart';

class SharedPreferenceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared Prefernce"),
        ),
      ),
    );
  }
}
