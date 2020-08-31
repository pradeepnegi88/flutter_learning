import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool toggle = false;
  Color selectedColor;
  @override
  Widget build(BuildContext context) {
    var onChanged2 = (newValue) {
      setState(() {
        selectedColor = newValue;
      });
    };
    return MaterialApp(
      title: "Switch Case",
      home: Scaffold(
        backgroundColor: toggle ? Colors.blueGrey : null,
        appBar: AppBar(
          title: Text("Switch"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Dark Background",
              style: TextStyle(fontSize: 30),
            ),
            Switch(
              value: toggle,
              onChanged: (newValue) {
                setState(() {
                  toggle = newValue;
                });
              },
            ),
            Row(
              children: [
                Text("Green"),
                Radio(
                  value: Colors.green,
                  groupValue: selectedColor,
                  activeColor: Colors.green,
                  onChanged: onChanged2,
                ),
                Text("Red"),
                Radio(
                  value: Colors.red,
                  groupValue: selectedColor,
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      selectedColor = newValue;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
