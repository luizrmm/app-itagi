import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String value;
  Label({this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 12.0),
      child: Row(
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
