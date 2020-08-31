import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Switch Case",
      home: Scaffold(
        backgroundColor: toggle ? Colors.blueGrey : null,
        appBar: AppBar(
          title: Text("Switch"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
