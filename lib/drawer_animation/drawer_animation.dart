import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        body: ZigZag(),
      ),
    );
  }

  Widget animatedContainerWidget(BuildContext context) {
    return Center(
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
    ));
  }
}

class TweenAnimationWidget extends StatefulWidget {
  @override
  _TweenAnimationWidgetState createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> {
  Tween<double> _scaleDown = Tween<double>(begin: 1, end: 2);
  @override
  Widget build(BuildContext context) {
    var tweenAnimationBuilder = TweenAnimationBuilder(
      tween: _scaleDown,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      duration: Duration(milliseconds: 600),
      child: Container(
          color: Colors.teal,
          child:
              Text("Animation", style: Theme.of(context).textTheme.headline5)),
    );
    return Center(
      child: tweenAnimationBuilder,
    );
  }
}

class StackAnimation extends StatefulWidget {
  @override
  _StackAnimationState createState() => _StackAnimationState();
}

class _StackAnimationState extends State<StackAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          print("#############################${_controller.value}");
          final contentScale = 1.0 - (0.3 * _controller.value);

          return Stack(
            children: [
              Transform(
                transform: Matrix4.identity()..rotateY(0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.red),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..scale(contentScale)
                  ..translate(_controller.value * 200, _controller.value * 200),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.green,
                ),
              ),
              // Transform(
              //   transform: Matrix4.identity()
              //     ..rotateY(2 * math.pi * (1 - _controller.value)),
              //   child: Container(width: 100, height: 100, color: Colors.yellow),
              // ),
              // Transform(
              //   transform: Matrix4.identity()
              //     ..rotateY(3 * (math.pi / 2) * (1 - _controller.value)),
              //   child: Container(width: 100, height: 100, color: Colors.black),
              // ),
            ],
          );
        },
      ),
    );
  }
}

class ZigZag extends StatefulWidget {
  @override
  _ZigZagState createState() => _ZigZagState();
}

class _ZigZagState extends State<ZigZag> with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.red,
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0003)
                ..rotateX((math.pi / 2) * (1 - _controller.value)),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.green,
                ),
                elevation: _controller.value * 10,
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0003)
                ..rotateX((math.pi / 2) * (_controller.value)),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.blue,
                ),
                elevation: _controller.value * 10,
              ),
            ),
          ],
        );
      },
    );
  }
}
