import 'package:flutter/material.dart';
import 'package:myapp/routerapp/routes/fourth.dart';
import 'package:myapp/routerapp/routes/home.dart';
import 'package:myapp/routerapp/routes/product_description.dart';
import 'package:myapp/routerapp/routes/product_home.dart';
import 'package:myapp/routerapp/routes/second.dart';
import 'package:myapp/routerapp/routes/third.dart';

import 'model/student.dart';

/*
 Routers are two types:
 1. On the fly Routes(Code duplication)
 2. Named Routes
**/

class RouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mainRoutes = {
      Home.route: (context) => Home(),
      SecondScreen.route: (context) => SecondScreen(),
      ThirdScreen.route: (context) => ThirdScreen(),
      FourthScreen.route: (context) => FourthScreen(),
      ProductHome.route: (context) => ProductHome(),
      ProductDescription.route: (context) => ProductDescription()
    };
    return MaterialApp(
      title: "Router App",
      // ignore: missing_return
      onGenerateRoute: (settings) {
        if (settings.name == ThirdScreen.route) {
          final Student s = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => ThirdScreen(name: s.name, age: s.age),
          );
        }

        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade200,
      ),
      // home: Home(),
      initialRoute: "/",
      routes: mainRoutes,
    );
  }
}
