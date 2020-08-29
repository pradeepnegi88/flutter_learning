import 'package:flutter/material.dart';
import 'package:myapp/routerapp/model/student.dart';
import 'package:myapp/routerapp/routes/second.dart';
import 'package:myapp/routerapp/routes/third.dart';

class Home extends StatelessWidget {
  static const route = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home Page",
                style: Theme.of(context).textTheme.headline5,
              ),
              RaisedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen(),
                  //   ),
                  // );
                  Navigator.pushNamed(context, SecondScreen.route,
                      arguments: Student(name: "Pradeep", age: 33));
                },
                child: Text("Open Home"),
              ),
              RaisedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen(),
                  //   ),
                  // );
                  Navigator.pushNamed(context, ThirdScreen.route,
                      arguments: Student(name: "Pradeep1", age: 33));
                },
                child: Text("Open Third"),
              )
            ],
          ),
        ));
  }
}
