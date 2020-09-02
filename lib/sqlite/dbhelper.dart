import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'model/course.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), "study.db");
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      //create all tables here
      db.execute(
          "create table courses(id integre primary key autoincrement, name varchar(50), content varchar(255), hours integer)");
    });
    return _db;
  }

  Future<int> createCourse(Course course) async {
    Database db = await createDatabase();
    return db.insert("courses", course.toMap());
  }

  Future<List> allCourses() async {
    Database db = await createDatabase();
    return db.query("courses");
  }

  Future<int> deleteCourse(int courseId) async {
    Database db = await createDatabase();
    return db.delete("courses", where: "id = ?", whereArgs: [courseId]);
  }
}
