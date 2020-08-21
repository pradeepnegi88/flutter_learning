import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: Material(
          child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 56.0,
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    tooltip: 'Navigation menu',
                    onPressed: null,
                  ),
                  Expanded(
                    child: Text("Title"),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search',
                    onPressed: null,
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Hello World'),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('My button was tapped');
              },
              child: Container(
                height: 36.0,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.lightGreen.shade500),
                child: Center(
                  child: Text('Engage'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
