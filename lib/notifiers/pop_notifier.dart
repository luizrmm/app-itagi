import 'package:flutter/material.dart';

class PopUpNotifier with ChangeNotifier {
  bool _show = true;
  bool get show => _show;

  void hidePopUp() {
    _show = false;
    notifyListeners();
  }
}
