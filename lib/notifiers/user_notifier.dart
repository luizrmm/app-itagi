import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/repository/user_repository.dart';
import 'package:aqui_cliente/view-models/cadastro_viewmodel.dart';
import 'package:aqui_cliente/view-models/login_viewmodel.dart';
import 'package:flutter/material.dart';

class UserNotifier with ChangeNotifier {
  final UserRepository _userRepository;
  UserNotifier(this._userRepository);

  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  UserModel _user;
  UserModel get user => _user;

  Future<void> authenticate(LoginViewModel model) async {
    setLoading(true);
    try {
      _user = await _userRepository.authenticate(model);
      _requestSucces = true;
      setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
      _requestSucces = false;
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> account(CadastroViewModel model) async {
    setLoading(true);
    try {
      _successMessage = await _userRepository.account(model);
      _requestSucces = true;
      setLoading(false);
    } catch (e) {
      _requestSucces = false;
      _errorMessage = e.response.data['mensagem'];
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
