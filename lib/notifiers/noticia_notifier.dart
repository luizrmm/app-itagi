import 'package:aqui_cliente/models/noticia_model.dart';
import 'package:aqui_cliente/repository/noticias_repository.dart';
import 'package:flutter/material.dart';

class NoticiaNotifier with ChangeNotifier {
  final NoticiasRepository _noticiasRepository;
  NoticiaNotifier(this._noticiasRepository) {
    getNoticias();
  }

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  bool _success = false;
  bool get success => _success;

  List<NoticiaModel> _noticias = new List();
  List<NoticiaModel> get noticias => _noticias;

  Future getNoticias() async {
    _setLoading(true);
    try {
      _noticias = await _noticiasRepository.getNoticias();
      _success = true;
      _setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
      _success = false;
      _setLoading(false);
    }
  }

  Future curtir(Map<String, dynamic> json) async {
    try {
      await _noticiasRepository.curtir(json);
      getNoticias();
      notifyListeners();
    } catch (e) {
      _success = false;
      _errorMessage = e.response.data['mensagem'];
      notifyListeners();
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
