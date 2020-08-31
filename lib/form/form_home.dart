import 'package:flutter/material.dart';

class FormHome extends StatefulWidget {
  @override
  _FormHomeState createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var focus;

  @override
  void initState() {
    super.initState();
    focus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focus.dispos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
            TextFormField(
              focusNode: focus,
              decoration: InputDecoration(hintText: "Enter age"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            RaisedButton(
              onPressed: () {
                focus.requestFocus();
                if (formKey.currentState.validate()) {
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Data validated"),
                    ),
                  );
                }
              },
              child: Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
