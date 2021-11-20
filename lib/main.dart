import 'package:calculatorr/pages/home.dart';
import 'package:calculatorr/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose()
  {
   _themeManager.removeListener(themeListner);
  }

  @override
  void initState()
  {
    _themeManager.addListener(themeListner );
    super.initState();
  }

  themeListner()
  {
    if(mounted)
    {
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
       title: "Calculator",
       debugShowCheckedModeBanner: false,
       theme: lightTheme,
       darkTheme: darkTheme,
       themeMode: _themeManager.themeMode,
       home: Home(themeManager: _themeManager,),


    );
  }
}