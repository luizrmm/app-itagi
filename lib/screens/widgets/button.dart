import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function function;
  DefaultButton({this.text, this.function});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.45,
      height: 42,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      color: Theme.of(context).primaryColor,
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
