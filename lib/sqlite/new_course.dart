import 'package:flutter/material.dart';
import 'package:myapp/sqlite/dbhelper.dart';

import 'model/course.dart';

class AddCourse extends StatefulWidget {
  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  String name, content;
  int hours;
  DBHelper dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Course")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Enter course name"),
                  onChanged: (newValue) {
                    setState(() {
                      name = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(hintText: "Enter content"),
                  onChanged: (newValue) {
                    setState(() {
                      content = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter hours"),
                  keyboardType: TextInputType.number,
                  onChanged: (newValue) {
                    setState(() {
                      hours = int.parse(newValue);
                    });
                  },
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text("Save"),
                  onPressed: () async {
                    final course = Course(
                        {"name": name, "content": content, "hours": hours});
                    await dbHelper.createCourse(course);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
