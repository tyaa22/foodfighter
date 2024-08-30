import 'package:flutter/material.dart';
import 'package:foodfighter/themes/dark_theme.dart';
import 'package:foodfighter/themes/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  void toggleTheme() {
    if(_themeData == lightMode) {
      themeData = darkMode;
    }
    else {
      themeData = lightMode;
    }
  }
}