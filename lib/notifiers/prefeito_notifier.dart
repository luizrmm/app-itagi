import 'package:aqui_cliente/models/prefeito_model.dart';
import 'package:aqui_cliente/repository/prefeito_repository.dart';
import 'package:flutter/material.dart';

class PrefeitoNotifier with ChangeNotifier {
  final PrefeitoRepository _prefeitoRepository;
  PrefeitoNotifier(this._prefeitoRepository) {
    getPrefeitoData();
  }

  bool _loading = false;
  bool get loading => _loading;

  PrefeitoModel _prefeito;
  PrefeitoModel get prefeito => _prefeito;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future getPrefeitoData() async {
    setLoading(true);
    try {
      _prefeito = await _prefeitoRepository.getPrefeitoData();
      print(_prefeito.imagem);
      setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
