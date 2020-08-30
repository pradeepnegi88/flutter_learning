import 'package:flutter/material.dart';
import 'package:myapp/push_pop/screen1.dart';
import 'package:myapp/push_pop/screen2.dart';

class PushHome extends StatelessWidget {
  static const route = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PushHome Screen"),
      ),
      body: Column(children: [
        RaisedButton(
          onPressed: () {
            // Navigator.of(context).pushNamed(ScreenOne.route);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScreenOne()));
          },
          child: Text("Screen One"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ScreenTwo.route);
          },
          child: Text("Screen Two"),
        ),
        RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("back"),
        ),
      ]),
    );
  }
}
