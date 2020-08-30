import 'package:flutter/material.dart';
import 'package:myapp/routerapp/model/student.dart';
import 'package:myapp/routerapp/routes/fourth.dart';
import 'package:myapp/routerapp/routes/second.dart';
import 'package:myapp/routerapp/routes/third.dart';

class Home extends StatelessWidget {
  static const route = "/";
  @override
  Widget build(BuildContext context) {
    final ScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: ScaffoldKey,
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
              ),
              RaisedButton(
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen(),
                  //   ),
                  // );
                  var result = await Navigator.pushNamed(
                    context,
                    FourthScreen.route,
                  );
                  ScaffoldKey.currentState
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("Data result is : $result")));
                },
                child: Text("Get Result data from other screen"),
              )
            ],
          ),
        ));
  }
}
