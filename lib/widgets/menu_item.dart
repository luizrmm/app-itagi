import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String label;
  final String icon;
  MenuItem({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0), color: Colors.white),
        padding: EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              icon,
              height: 70,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
