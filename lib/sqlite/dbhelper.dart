import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
    // Get a location using getDatabasesPath
    var databasesPath = await getApplicationDocumentsDirectory();
    String path = join(databasesPath.uri.toString(), 'study.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      //create all tables here
      await db.execute("""
CREATE TABLE courses(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, content TEXT, hours INTEGER)""");
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
