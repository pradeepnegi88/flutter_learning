import 'package:flutter/material.dart';
import 'package:myapp/push_pop/push_home.dart';
import 'package:myapp/push_pop/screen1.dart';

class PushMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Push Pop Learning",
      initialRoute: PushHome.route,
      routes: {
        PushHome.route: (context) => PushHome(),
        ScreenOne.route: (context) => ScreenOne(),
      },
      theme: ThemeData(
        canvasColor: Colors.grey.shade200,
        primaryColor: Colors.grey,
      ),
      // home: PushHome(),
    );
  }
}
