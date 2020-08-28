import 'package:flutter/material.dart';
import 'package:myapp/routerapp/routes/home.dart';
import 'package:myapp/routerapp/routes/second.dart';

/*
 Routers are two types:
 1. On the fly Routes(Code duplication)
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
      // home: Home(),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/second": (context) => SecondScreen()
      },
    );
  }
}
