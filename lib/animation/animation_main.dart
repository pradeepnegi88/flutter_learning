// import 'package:flutter/material.dart';

// class AnimationMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnimationHome();
//   }
// }

// class AnimationHome extends StatefulWidget {
//   @override
//   _AnimationHomeState createState() => _AnimationHomeState();
// }

// class _AnimationHomeState extends State<AnimationHome>
//     with SingleTickerProviderStateMixin {
//   Animation animation;
//   AnimationController animationController;
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(duration: Duration(seconds: 2), vsync: this);
//     animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
//         parent: animationController, curve: Curves.fastOutSlowIn));
//     animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final double width = MediaQuery.of(context).size.width;
//     return AnimatedBuilder(
//       animation: animationController,
//       builder: (context, child) => Scaffold(
//         appBar: AppBar(
//           title: Text("Animation"),
//         ),
//         body: Transform(
//           transform: Matrix4.translationValues(
//               animation.value * MediaQuery.of(context).size.width, 0.0, 0.0),
//           child: Center(child: Text("Animation")),
//         ),
//       ),
//     );
//   }
// }
