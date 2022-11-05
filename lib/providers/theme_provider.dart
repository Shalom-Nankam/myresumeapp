import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void appDarkTheme(bool value) {
    _darkTheme = value;
    setDarkTheme(value);
    notifyListeners();
  }

  void setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Dark', value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('Dark') ?? true;
  }

  void getCurrentAppTheme() async {
    _darkTheme = await getTheme();
  }
}
