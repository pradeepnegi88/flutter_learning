import 'package:flutter/material.dart';

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
          onPressed: () {},
          child: Text("Home"),
        ),
      ]),
    );
  }
}
