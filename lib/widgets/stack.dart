import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Colors.pink.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Example"),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) => Stack(
            fit: StackFit.expand,
            children: [
              Banner(
                message: "Top Start",
                location: BannerLocation.topStart,
              ),
              Banner(
                message: "Top end",
                location: BannerLocation.topEnd,
              ),
              Banner(
                message: "Bottom Start",
                location: BannerLocation.bottomStart,
              ),
              Banner(
                message: "Bottom End",
                location: BannerLocation.bottomEnd,
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Icon(
                  Icons.star,
                  size: 100,
                ),
              ),
              Positioned(
                top: constraint.maxHeight - 100,
                left: constraint.maxWidth - 100,
                child: Icon(
                  Icons.theaters,
                  size: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
