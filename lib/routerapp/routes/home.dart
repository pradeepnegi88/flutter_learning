import 'package:flutter/material.dart';

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
                  Navigator.pushNamed(context, "/second");
                },
                child: Text("Open Home"),
              )
            ],
          ),
        ));
  }
}
