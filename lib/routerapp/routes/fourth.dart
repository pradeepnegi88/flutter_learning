import 'package:flutter/material.dart';
// Pass Arguements to name route
//1. ModalRoute
//2. onGenerateRoute

class FourthScreen extends StatelessWidget {
  static const route = "/fourth";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fourth Screen Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fourth Screen Page",
                style: Theme.of(context).textTheme.headline5,
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop("Yes"),
                child: Text("Yes"),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop("No"),
                child: Text("No"),
              )
            ],
          ),
        ));
  }
}
