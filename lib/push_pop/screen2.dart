import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  static const route = "/screen2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Center(
          child: Container(
        color: Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Screen Two"),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {},
              child: Text("Home"),
            ),
          ],
        ),
      )),
    );
  }
}
