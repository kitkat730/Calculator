import 'package:flutter/material.dart';
import 'package:calculatorr/theme.dart';
import 'package:calculatorr/calculation.dart';

List<String> list = [
  "AC",
  "C",
  "%",
  "÷",
  "7",
  '8',
  '9',
  '*',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '--',
  '0',
  '.',
  '='
];

String value1 = '';
String result = '';

class Home extends StatefulWidget {
  final ThemeManager themeManager;
  const Home({Key? key, required this.themeManager}) : super(key: key);
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
        actions: [
          Switch(
              value: widget.themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                widget.themeManager.toogleTheme(newValue);
              })
        ],
      ),
      body: const BodyUi(),
    );
  }
}

final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

void printData(String data) {
  print(data);
}

SliverGridDelegateWithFixedCrossAxisCount getSilverGrid(BuildContext context) {
  var _crossAxisSpacing = 10;
  var _screenWidth = MediaQuery.of(context).size.width;
  var _crossAxisCount = 4;
  var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
      _crossAxisCount;
  var cellHeight = 60;
  var _aspectRatio = _width / cellHeight;
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4, childAspectRatio: _aspectRatio, mainAxisSpacing: 20);
}

class BodyUi extends StatefulWidget {
  const BodyUi({Key? key}) : super(key: key);

  @override
  State<BodyUi> createState() => _BodyUiState();
}

class _BodyUiState extends State<BodyUi> {
  void calculate(String str) {
    setState(() {
      value1 += str;
      Calculation calc = Calculation.add(value1);
      result = calc.result.toString();
    });
  }

  Widget getData(String str) {
    bool equalSign = false;
    if (str == '=') {
      equalSign = true;
    }

    if (str == '=' || str == "÷" || str == '*' || str == '-' || str == '+') {
      FloatingActionButtonLocation:
      FloatingActionButtonLocation.miniEndDocked;
      return FloatingActionButton(
        onPressed: () {
          calculate(str);
        },
        child: Text(str,
            style: const TextStyle(
              fontSize: 40,
            )),
        backgroundColor: equalSign ? Colors.red : Colors.grey,
      );
    } else {
      return Card(
        color: const Color.fromRGBO(242, 242, 242, 0.4),
        child: ListTile(
          title: Center(
            child: Text(
              str,
              style: const TextStyle(fontSize: 26),
            ),
          ),
          onTap: () {
            printData(str);
            calculate(str);
          },
        ),
        elevation: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: value1.isEmpty
              ? Container(
                  child: const Text(
                    "Calculator",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.topLeft,
                )
              : Container(
                  child: Text(
                    value1,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.topRight,
                ),
        ),
        SizedBox(
          child: Container(
            child: Text(
              result.isEmpty ? "" : result,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.topRight,
          ),
          height: 190,
        ),
        Expanded(
            child: Container(
          color: const Color.fromRGBO(242, 242, 242, 0.4),
          padding: const EdgeInsets.only(top: 15),
          child: GridView(
            gridDelegate: getSilverGrid(context),
            children: list.map((url) {
              return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: getData(url));
            }).toList(),
          ),
        )),
      ],
    )));
  }
}
