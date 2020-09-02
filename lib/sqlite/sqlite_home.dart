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
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
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
      body: FutureBuilder(
          future: dbHelper.allCourses(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Course course = Course.fromMap(snapshot.data[index]);
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
                  });
            }
          }),
    );
  }
}
