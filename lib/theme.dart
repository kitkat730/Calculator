import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepOrange
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple
);

class ThemeManager with ChangeNotifier
{
  ThemeMode _themeMode = ThemeMode.dark;

  get themeMode => _themeMode;
  
  toogleTheme(bool bDark)
  {
    _themeMode = bDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}