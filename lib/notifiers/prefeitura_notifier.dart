import 'package:aqui_cliente/models/prefeitura_model.dart';
import 'package:aqui_cliente/repository/prefeitura_repository.dart';
import 'package:flutter/material.dart';

class PrefeituraNotifier with ChangeNotifier {
  final PrefeituraRepository _prefeituraRepository;
  PrefeituraNotifier(this._prefeituraRepository) {
    getPrefeituraData();
  }

  bool _loading = false;
  bool get loading => _loading;

  PrefeituraModel _prefeitura;
  PrefeituraModel get prefeitura => _prefeitura;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future getPrefeituraData() async {
    setLoading(true);
    try {
      _prefeitura = await _prefeituraRepository.getPrefeitoData();
      setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
