import 'package:aqui_cliente/models/popup_model.dart';
import 'package:aqui_cliente/repository/popUp_repository.dart';
import 'package:flutter/material.dart';

class PopUpNotifier with ChangeNotifier {
  final PopUpRepository _popUpRepository;
  PopUpNotifier(this._popUpRepository) {
    getData();
  }

  bool _show = true;
  bool get show => _show;

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  bool _success;
  bool get success => _success;

  List<PopModel> _imagens = new List();
  List<PopModel> get imagens => _imagens;

  Future getData() async {
    setLoading(true);
    try {
      _imagens = await _popUpRepository.getPopUp();
      _success = true;
      setLoading(false);
    } catch (e) {
      _success = false;
      _errorMessage = e.response.data['mensagem'];
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void hidePopUp() {
    _show = false;
    notifyListeners();
  }
}
