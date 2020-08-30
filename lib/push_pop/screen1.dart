import 'dart:js';

import 'package:flutter/material.dart';
import 'package:myapp/push_pop/screen2.dart';

class ScreenOne extends StatelessWidget {
  static const route = "/screen1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One'),
      ),
      body: Center(
          child: Container(
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Screen One"),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed(ScreenTwo.route);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ScreenTwo()));
              },
              child: Text("Screen Two"),
            ),
          ],
        ),
      )),
    );
  }
}
