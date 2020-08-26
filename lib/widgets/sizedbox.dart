import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sized Box",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sized Box'),
        ),
        body: SizedBox.expand(
          child: Card(
            child: Column(
              children: [
                Text(
                  "Hello Flutter ",
                ),
                Icon(
                  Icons.star,
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  size: 50,
                ),
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.star,
                  size: 50,
                ),
                WidgetGone(),
              ],
            ),
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

class WidgetGone extends StatefulWidget {
  @override
  _WidgetGoneState createState() => _WidgetGoneState();
}

class _WidgetGoneState extends State<WidgetGone> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          isClicked
              ? Icon(
                  Icons.stars,
                  color: Colors.teal,
                  size: 50,
                )
              : SizedBox(),
          RaisedButton(
            onPressed: () {
              setState(
                () {
                  isClicked = !isClicked;
                },
              );
            },
            child: Text("Toggle"),
          )
        ],
      ),
    );
  }
}
