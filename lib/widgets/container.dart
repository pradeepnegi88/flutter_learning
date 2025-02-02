import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Container"),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png"),
                  ),
                  border: Border.all(
                    color: Colors.red,
                    width: 5,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                    gradient: RadialGradient(colors: [
                      Colors.orange,
                      Colors.white,
                      Colors.green,
                    ], stops: [
                      0.4,
                      1.0,
                    ])),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          foregroundDecoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
