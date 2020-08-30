import 'package:flutter/material.dart';

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
        child: Text("Screen One"),
      )),
    );
  }
}
