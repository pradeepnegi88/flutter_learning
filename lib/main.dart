import 'package:flutter/material.dart';
import 'package:myapp/widgets/listview.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade100,
      ),
      title: 'Welcome to flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to flutter app"),
        ),
        body: RandomWords(),
      ),
    ));
