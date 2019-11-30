import 'package:flutter/material.dart';

class TelefoneTile extends StatelessWidget {
  final String title;
  final List<Widget> telefones;
  TelefoneTile({this.title, this.telefones});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: telefones,
          )
        ],
      ),
    );
  }
}
