import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int colorSelected = Colors.white.value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorSelected),
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
          child: Column(
        children: [
          RadioListTile(
            value: Colors.green.value,
            groupValue: colorSelected,
            onChanged: (newColor) {
              setState(() {
                colorSelected = newColor;
              });
            },
            title: Text("Green"),
          ),
          RadioListTile(
            value: Colors.red.value,
            groupValue: colorSelected,
            onChanged: (newColor) {
              setState(() {
                colorSelected = newColor;
              });
            },
            title: Text("Red"),
          ),
          RadioListTile(
            value: Colors.orange.value,
            groupValue: colorSelected,
            onChanged: (newColor) {
              setState(() {
                colorSelected = newColor;
              });
            },
            title: Text("Orange"),
          )
        ],
      )),
    );
  }
}
