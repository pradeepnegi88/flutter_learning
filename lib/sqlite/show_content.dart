import 'package:flutter/material.dart';

import 'model/course.dart';

class ShowCourse extends StatefulWidget {
  final Course course;
  ShowCourse({this.course});
  @override
  _ShowCourseState createState() => _ShowCourseState();
}

class _ShowCourseState extends State<ShowCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Content")),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [
          Text(
            super.widget.course.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            super.widget.course.content,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            super.widget.course.hours.toString(),
            style: Theme.of(context).textTheme.bodyText2,
          )
        ]),
      ),
    );
  }
}
