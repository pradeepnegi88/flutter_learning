import 'package:flutter/material.dart';
import 'package:myapp/sqlite/dbhelper.dart';
import 'package:myapp/sqlite/show_content.dart';

import 'model/course.dart';
import 'new_course.dart';

class SqliteHome extends StatefulWidget {
  @override
  _SqliteHomeState createState() => _SqliteHomeState();
}

class _SqliteHomeState extends State<SqliteHome> {
  DBHelper dbHelper;
  List allCourses = List();
  List items = List();
  TextEditingController textSearch = TextEditingController();
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    dbHelper.allCourses().then((value) {
      setState(() {
        allCourses = value;
        items = allCourses;
      });
    });
  }

  void filterSearch(String query) {
    var dummySearchList = List();
    if (query.isNotEmpty) {
      allCourses.forEach((element) {
        var course = Course.fromMap(element);
        if (course.name.toLowerCase().contains(query.toLowerCase())) {
          dummySearchList.add(element);
        }
        setState(() {
          items = [];
          items.addAll(dummySearchList);
        });
      });
    } else {
      setState(() {
        items = [];
        items = allCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddCourse()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  filterSearch(value);
                });
              },
              controller: textSearch,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search ....",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      Course course = Course.fromMap(items[index]);
                      return Card(
                        child: ListTile(
                          title: Text('${course.name} - ${course.hours} hours'),
                          subtitle: Text(course.content),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await dbHelper.deleteCourse(course.id);
                            },
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ShowCourse(course: course)));
                          },
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
