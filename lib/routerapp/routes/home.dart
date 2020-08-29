import 'package:flutter/material.dart';
import 'package:myapp/routerapp/model/student.dart';

class Home extends StatelessWidget {
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
                  Navigator.pushNamed(context, "/second",
                      arguments: Student(name: "Pradeep", age: 33));
                },
                child: Text("Open Home"),
              )
            ],
          ),
        ));
  }
}
