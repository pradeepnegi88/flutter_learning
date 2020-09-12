import 'package:flutter/material.dart';

class DrawerMainAnimationWidget extends StatefulWidget {
  @override
  _DrawerMainAnimationWidgetState createState() =>
      _DrawerMainAnimationWidgetState();
}

class _DrawerMainAnimationWidgetState extends State<DrawerMainAnimationWidget> {
  double _width = 200;
  double _height = 200;
  _updateState() {
    setState(() {
      if (_width == 300) {
        _width = 200;
        _height = 200;
      } else {
        _width = 300;
        _height = 300;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animation"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                _updateState();
              },
              child: Text("Animate"),
            ),
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 600),
              width: _width,
              height: _height,
              color: Colors.red,
              child: Center(
                child: Text(
                  "Animation",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
