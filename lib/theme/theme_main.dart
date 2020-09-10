import 'package:flutter/material.dart';

class ThemeMaiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Theme Example",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.menu),
          ),
          title: Text("Theme"),
        ),
      ),
    );
  }
}
