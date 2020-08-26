import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Widget",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple.shade100,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material Widget'),
        ),
        body: Center(
          child: Material(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                side: BorderSide(
                  color: Colors.black,
                  width: 4,
                ),
              ),
              color: Colors.yellowAccent,
              child: Container(
                height: 200,
                width: 200,
              )),
        ),
      ),
    );
  }
}
