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
              ],
            ),
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
