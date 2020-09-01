import 'package:flutter/material.dart';
import 'package:myapp/offline/shared_home.dart';

class SharedPreferenceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          canvasColor: Colors.purple.shade200,
        ),
        home: SharedHome());
  }
}
