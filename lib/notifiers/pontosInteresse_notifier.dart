import 'package:aqui_cliente/models/pontosInteresse_model.dart';
import 'package:aqui_cliente/repository/pontosInteresse_repository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PontosInteresseNotifier with ChangeNotifier {
  final PontosInteresseRespository _pontosInteresseRespository;
  PontosInteresseNotifier(this._pontosInteresseRespository) {
    getPontosInteresse();
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _success;
  bool get succes => _success;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  List<PontosInteresseModel> _pontos = new List();
  List<PontosInteresseModel> get pontos => _pontos;

  Future getPontosInteresse() async {
    setLoading(true);
    try {
      _pontos = await _pontosInteresseRespository.getPontosInteresse();
      _success = true;
      setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
      _success = false;
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  launchURL(String value) async {
    var url = 'tel: $value';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível realizar operação';
    }
  }
}
