import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Second Screen Page",
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
