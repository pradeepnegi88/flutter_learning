import 'package:flutter/material.dart';
import 'package:myapp/routerapp/model/student.dart';
// Pass Arguements to name route
//1. ModalRoute
//2. onGenerateRoute

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Student student = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Second Screen Page ${student.name} and ${student.age}",
                style: Theme.of(context).textTheme.headline5,
              ),
              RaisedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Home(),
                  //   ),
                  // );
                  Navigator.pushNamed(context, "/");
                },
                child: Text("Open Third Screen"),
              )
            ],
          ),
        ));
  }
}
