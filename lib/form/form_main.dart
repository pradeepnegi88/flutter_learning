import 'package:flutter/material.dart';
import 'package:myapp/form/form_home.dart';

class FormMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form validation",
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        canvasColor: Colors.blueGrey.shade200,
      ),
      home: FormHome(),
    );
  }
}
