import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeNotifier with ChangeNotifier {
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  String _token;
  String get token => _token;

  changePage(int index) {
    _currentIndex = index;
    if (currentIndex == 0) {
      getToken();
      notifyListeners();
    }
    notifyListeners();
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }
}
