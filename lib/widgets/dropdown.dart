import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Intrinisc width and height example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("You Selected"),
            SizedBox(height: 20),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                RaisedButton(
                  onPressed: null,
                  child: Text("RaisedButton"),
                ),
                FlatButton(
                  onPressed: null,
                  child: Text("RaisedButton"),
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: null,
                ),
                SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
