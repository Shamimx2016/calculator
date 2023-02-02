import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int btnColor;
  final Function callback;

  const CustomButton(
      {required this.text, required this.btnColor, required this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          onPressed: () => callback(text),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(btnColor)),
            elevation: MaterialStateProperty.all(6),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
