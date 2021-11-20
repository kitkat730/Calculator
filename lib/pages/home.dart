import 'package:flutter/material.dart';
import 'package:calculatorr/theme.dart';

class Home extends StatefulWidget {
  final ThemeManager themeManager;

  const Home({Key? key,required this.themeManager}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 16),
        ),
        actions: [Switch(value: widget.themeManager.themeMode == ThemeMode.dark , onChanged: (newValue) {
                widget.themeManager.toogleTheme(newValue);
        })],
      ),
    );
  }
}
