import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.teal.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanded Widget"),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                height: 100,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                height: 100,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                height: 100,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Card(
                    child: Text("Helloo "),
                    color: Colors.yellow,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
