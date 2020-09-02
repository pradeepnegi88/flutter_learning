import 'package:flutter/material.dart';
import 'package:myapp/sqlite/sqlite_home.dart';

class SqliteWidget extends StatefulWidget {
  @override
  _SqliteWidgetState createState() => _SqliteWidgetState();
}

class _SqliteWidgetState extends State<SqliteWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        canvasColor: Colors.red.shade200,
      ),
      home: SqliteHome(),
    );
  }
}
