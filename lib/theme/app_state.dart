import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isDarkModeOn = true;
  void updateTheTheme(bool isDarkMode) {
    this.isDarkModeOn = isDarkMode;
    notifyListeners();
  }
}
