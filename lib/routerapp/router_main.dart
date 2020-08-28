import 'package:flutter/material.dart';
import 'package:myapp/routerapp/routes/home.dart';

/*
 Routers are two types:
 1. On the fly Routes
 2. Named Routes
**/

class RouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Router App",
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade200,
      ),
      home: Home(),
    );
  }
}
