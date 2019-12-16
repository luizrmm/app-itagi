import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function function;
  final bool isbusy;
  DefaultButton({this.text, this.function, @required this.isbusy});
  @override
  Widget build(BuildContext context) {
    if (isbusy) {
      return Center(
        child: Loading(),
      );
    }
    return Container(
      height: 42,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: Theme.of(context).primaryColor,
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
