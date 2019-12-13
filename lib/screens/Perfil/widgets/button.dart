import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function function;
  final Color color;
  Button({this.text, this.function, this.color});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.45,
      height: 42,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      color: color,
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
