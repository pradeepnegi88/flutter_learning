import 'package:flutter/material.dart';

import 'model/profile.dart';

class ProfilePageView extends StatefulWidget {
  PageController pageController = PageController(initialPage: 0);
  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int currentIndex = 0;
  Animation _slideAnimation;
  Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _slideAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Offset(0, 0), end: Offset(0, 1)), weight: 10),
      TweenSequenceItem(
          tween: Tween(begin: Offset(0, 1), end: Offset(0, 0)), weight: 90),
    ]).animate(_controller);

    _fadeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 90),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView.builder(
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                profiles[index].imagePath,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.hue,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.black.withOpacity(0.2)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: profiles.length,
        controller: widget.pageController,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
            _controller.reset();
            _controller.forward();
          });
        },
      ),
      Positioned(
        bottom: 60,
        left: 20,
        right: 20,
        child: ProfileDetails(
          index: currentIndex,
          slideAnimation: _slideAnimation,
          fadeTransition: _fadeAnimation,
        ),
      )
    ]);
  }
}

class ProfileDetails extends StatelessWidget {
  final int index;
  final Animation slideAnimation;
  Animation<double> fadeTransition;
  ProfileDetails({this.index, this.slideAnimation, this.fadeTransition});
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeTransition,
      child: SlideTransition(
        position: slideAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            TwoLineItem(
              crossAxisAlignment: CrossAxisAlignment.start,
              firstText: profiles[index].followers.toString(),
              secondText: "Followers",
            ),
            TwoLineItem(
              crossAxisAlignment: CrossAxisAlignment.center,
              firstText: profiles[index].posts.toString(),
              secondText: "Posts",
            ),
            TwoLineItem(
              crossAxisAlignment: CrossAxisAlignment.end,
              firstText: profiles[index].following.toString(),
              secondText: "Following",
            ),
          ],
        ),
      ),
    );
  }
}

class TwoLineItem extends StatelessWidget {
  final String firstText, secondText;
  final CrossAxisAlignment crossAxisAlignment;
  TwoLineItem({this.firstText, this.secondText, this.crossAxisAlignment});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          firstText,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          secondText,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w200, fontSize: 16),
        )
      ],
    );
  }
}
