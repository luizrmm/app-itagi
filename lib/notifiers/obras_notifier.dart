import 'package:aqui_cliente/models/noticia_model.dart';
import 'package:aqui_cliente/repository/obras_repository.dart';
import 'package:flutter/cupertino.dart';

class ObrasNotifier with ChangeNotifier {
  final ObrasRepository _obrasRepository;
  ObrasNotifier(this._obrasRepository) {
    getObras();
  }

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  bool _success = false;
  bool get success => _success;

  List<NoticiaModel> _obras = new List();
  List<NoticiaModel> get obras => _obras;

  Future getObras() async {
    _setLoading(true);
    try {
      _obras = await _obrasRepository.getObras();
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
      await _obrasRepository.curtir(json);
      getObras();
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
