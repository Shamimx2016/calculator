import 'package:calculator/custom_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var listNumbers = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  late int firstNum;
  late int secondNum;
  late int result;
  String history = "";
  String textDisplay = "";
  String operator = "";
  bool checkNewVal = false;

  void Calculate(String btnValue) {
    if (btnValue == "AC") {
      history = "";
      textDisplay = "";
      firstNum = 0;
      secondNum = 0;
      result = 0;
    } else if (btnValue == "C") {
      textDisplay = "";
    } else if (btnValue == "<") {
      if (textDisplay.isNotEmpty) {
        textDisplay = textDisplay.substring(0, textDisplay.length - 1);
        history = history.substring(0, history.length - 1);
      }
    } else if (btnValue == "+/-") {
      if (textDisplay[0] != "-") {
        textDisplay = "-" + textDisplay;
      } else {
        textDisplay = textDisplay.substring(1);
      }
    } else if (btnValue == "+" ||
        btnValue == "-" ||
        btnValue == "/" ||
        btnValue == "x" ||
        btnValue == "=") {
      history = history + "" + btnValue + "";
      if (btnValue == "+") {
        operator = btnValue;
        firstNum = int.parse(textDisplay);
        textDisplay = "";
      } else if (btnValue == "-") {
        operator = btnValue;
        firstNum = int.parse(textDisplay);
        textDisplay = "";
      } else if (btnValue == "x") {
        operator = btnValue;
        firstNum = int.parse(textDisplay);
        textDisplay = "";
      } else if (btnValue == "/") {
        operator = btnValue;
        firstNum = int.parse(textDisplay);
        textDisplay = "";
      } else if (btnValue == "=") {
        secondNum = int.parse(textDisplay);
        if (operator == "+") {
          result = firstNum + secondNum;
        } else if (operator == "-") {
          result = firstNum - secondNum;
        } else if (operator == "/") {
          result = firstNum ~/ secondNum;
        } else if (operator == "x") {
          result = firstNum * secondNum;
        }
        textDisplay = result.toString();
        history = history + textDisplay;
        checkNewVal = true;
      }
    } else if (listNumbers.contains(int.parse(btnValue))) {
      if (checkNewVal == true) {
        textDisplay = "";
        history = "";
      }
      checkNewVal = false;
      history = history + btnValue;
      textDisplay = textDisplay + btnValue;
    }
    setState(() {
      textDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFf1d2630),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  history,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  textDisplay,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "AC",
                  btnColor: 0xFFF74F45,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "C",
                  btnColor: 0xFFF74F45,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "<",
                  btnColor: 0xFF4F79DD,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "/",
                  btnColor: 0xFF4F79DD,
                  callback: Calculate,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "7",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "8",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "9",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "x",
                  btnColor: 0xFF4F79DD,
                  callback: Calculate,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "4",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "5",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "6",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "-",
                  btnColor: 0xFF4F79DD,
                  callback: Calculate,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "1",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "2",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "3",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "+",
                  btnColor: 0xFF4F79DD,
                  callback: Calculate,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "+/-",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "0",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "00",
                  btnColor: 0xFF373B3F,
                  callback: Calculate,
                ),
                CustomButton(
                  text: "=",
                  btnColor: 0xFF4F79DD,
                  callback: Calculate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
