import 'package:aqui_cliente/models/pontosInteresse_model.dart';
import 'package:aqui_cliente/repository/contatos_repository.dart';
import 'package:flutter/material.dart';

class ContatosNotifier with ChangeNotifier {
  final ContatosRepository _contatosRepository;
  ContatosNotifier(this._contatosRepository) {
    getContatos();
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _success = false;
  bool get success => _success;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  List<PontosInteresseModel> _pontos;
  List<PontosInteresseModel> get pontos => _pontos;

  Future getContatos() async {
    setLoading(true);
    try {
      _pontos = await _contatosRepository.getContatos();
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
}
