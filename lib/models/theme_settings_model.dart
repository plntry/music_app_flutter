import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettingsModel extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  ThemeSettingsModel(bool isDark) {
    isDark
        ? _currentTheme = ThemeData.dark()
        : _currentTheme = ThemeData.light();
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (_currentTheme == ThemeData.light()) {
      _currentTheme = ThemeData.dark();
      sharedPreferences.setBool('is_dark', true);
    } else {
      _currentTheme = ThemeData.light();
      sharedPreferences.setBool('is_dark', false);
    }
    notifyListeners();
  }
}
