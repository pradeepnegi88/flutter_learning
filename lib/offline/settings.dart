import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int colorSelected = Colors.white.value;
  SharedPreferences prefs;
  saveColor(int color) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt("colorSelected", color);
  }

  getColor() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      colorSelected = prefs.getInt("colorSelected") ?? Colors.white.value;
    });
  }

  @override
  void initState() {
    super.initState();
    getColor();
  }

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
              saveColor(newColor);
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
              saveColor(newColor);
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
              saveColor(newColor);
            },
            title: Text("Orange"),
          )
        ],
      )),
    );
  }
}
