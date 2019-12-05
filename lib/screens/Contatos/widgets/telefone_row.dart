import 'package:flutter/material.dart';

class TelefoneRow extends StatelessWidget {
  final String telNumber;
  TelefoneRow({this.telNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('Telefone - '),
          Text(
            telNumber,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
