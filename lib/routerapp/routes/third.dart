import 'package:flutter/material.dart';
import 'package:myapp/routerapp/routes/home.dart';
// Pass Arguements to name route
//1. ModalRoute
//2. onGenerateRoute

class ThirdScreen extends StatelessWidget {
  static const route = "/third";
  final String name;
  final int age;
  ThirdScreen({this.name, this.age});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Third Screen Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Third Screen Page $name and $age",
                style: Theme.of(context).textTheme.headline5,
              ),
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, Home.route),
                child: Text("Open Third Screen"),
              )
            ],
          ),
        ));
  }
}
