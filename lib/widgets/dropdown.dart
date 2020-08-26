import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<String> _courses;
  String selectedItem;
  @override
  void initState() {
    super.initState();
    _courses = ["Dart", "Flutter", "Android", "iOS"];
    selectedItem = _courses.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("DropdownButton")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("You Selected $selectedItem"),
            SizedBox(height: 20),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                RaisedButton(
                  onPressed: null,
                  child: Text("RaisedButton"),
                ),
                FlatButton(
                  onPressed: null,
                  child: Text("RaisedButton"),
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: null,
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownButton(
              items: _courses.map(
                (value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              onChanged: (changedValue) {
                setState(() {
                  selectedItem = changedValue;
                });
              },
              value: selectedItem,
            )
          ],
        ),
      ),
    );
  }
}
