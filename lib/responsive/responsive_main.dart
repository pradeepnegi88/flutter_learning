import 'package:flutter/material.dart';
import 'package:myapp/responsive/profile.dart';

import 'app_bottom_bar.dart';

class ResponsiveMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Responsive Ui",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ResponsiveHomewidget(),
    );
  }
}

class ResponsiveHomewidget extends StatefulWidget {
  @override
  _ResponsiveHomewidgetState createState() => _ResponsiveHomewidgetState();
}

class _ResponsiveHomewidgetState extends State<ResponsiveHomewidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final double _beginHeightFactor = 0.90;
  final double _endHeightFactor = 0.75;
  Animation<double> _heightFactorAnimation;
  bool isAnimationCompleted = false;
  double screenHeight;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _heightFactorAnimation =
        Tween<double>(begin: _beginHeightFactor, end: _endHeightFactor)
            .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  onBottomPartTap() {
    setState(() {
      if (!isAnimationCompleted) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      isAnimationCompleted = !isAnimationCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: AnimatedBuilder(
          animation: _heightFactorAnimation,
          builder: (context, widget) {
            return getWidget();
          }),
      bottomNavigationBar: AppBottomBar(),
    );
  }

  Widget getWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        FractionallySizedBox(
          heightFactor: _heightFactorAnimation.value,
          alignment: Alignment.topCenter,
          child: ProfilePageView(),
        ),
        GestureDetector(
          onTap: () {
            onBottomPartTap();
          },
          onVerticalDragUpdate: _handleVerticalDragUpdate,
          onVerticalDragEnd: _handleVerticalDragEnd,
          child: FractionallySizedBox(
            heightFactor: 1.05 - _heightFactorAnimation.value,
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
            ),
          ),
        )
      ],
    );
  }

  _handleVerticalDragUpdate(DragUpdateDetails updateDetails) {
    var fractionalDragged = updateDetails.primaryDelta / screenHeight;
    _controller.value -= 5 * fractionalDragged;
  }

  _handleVerticalDragEnd(DragEndDetails endDetails) {
    if (_controller.value >= 0.5) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
