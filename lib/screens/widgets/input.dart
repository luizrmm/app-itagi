import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final bool isObscure;
  final Function(String) validatorFunc;
  final TextEditingController controller;
  final TextInputType type;
  Input({this.isObscure, this.validatorFunc, this.controller, this.type});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      elevation: 7.0,
      shadowColor: Colors.black,
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        obscureText: isObscure,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide.none)),
        validator: validatorFunc,
      ),
    );
  }
}
