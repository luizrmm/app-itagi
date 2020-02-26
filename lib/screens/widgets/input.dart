import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final bool isObscure;
  final Function(String) validatorFunc;
  final Function(String) saveFunc;
  final Function(String) submitedFunc;
  final TextEditingController controller;
  final TextInputType type;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final TextInputAction action;

  Input(
      {this.isObscure,
      this.validatorFunc,
      this.controller,
      this.type,
      this.focusNode,
      this.action,
      this.nextFocus,
      this.saveFunc,
      this.submitedFunc});
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 6.0,
      child: TextFormField(
        onFieldSubmitted: submitedFunc,
        textInputAction: action,
        focusNode: focusNode,
        keyboardType: type,
        controller: controller,
        obscureText: isObscure ?? false,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none),
        ),
        validator: validatorFunc,
        onSaved: saveFunc,
      ),
    );
  }
}
