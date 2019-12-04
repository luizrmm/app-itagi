import 'package:flutter/material.dart';

class HomeNotifier with ChangeNotifier {
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
