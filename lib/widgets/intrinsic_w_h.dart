import 'package:flutter/material.dart';

class IntrinsicWH extends StatelessWidget {
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
        body: Center(
            child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton(
                onPressed: null,
                child: Text("Short"),
              ),
              RaisedButton(
                onPressed: null,
                child: Text("Middle text"),
              ),
              RaisedButton(
                onPressed: null,
                child: Text("Long long long text"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
