import 'package:aqui_cliente/models/cidade_model.dart';
import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/repository/user_repository.dart';
import 'package:aqui_cliente/utils/utils.dart';
import 'package:aqui_cliente/view-models/cadastro_viewmodel.dart';
import 'package:aqui_cliente/view-models/login_viewmodel.dart';
import 'package:aqui_cliente/view-models/perfil_viewmodel.dart';
import 'package:flutter/material.dart';

class UserNotifier with ChangeNotifier {
  final UserRepository _userRepository;
  UserNotifier(this._userRepository) {
    getCidades('BA');
  }

  Utils utils = new Utils();

  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

  bool _loading = false;
  bool get loading => _loading;

  bool _loadingCity = false;
  bool get loadingCity => _loadingCity;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  String _token;
  String get token => _token;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  UserModel _user;
  UserModel get user => _user;

  String _city;
  String get city => _city;

  String _estado;
  String get estado => _estado;

  List<CidadeModel> _cidades;
  List<CidadeModel> get cidades => _cidades;

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

  Future getUser() async {
    setLoading(true);
    try {
      _user = await _userRepository.getUser();
      setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
      setLoading(false);
    }
  }

  Future editPerfil(PerfilViewModel model) async {
    setLoading(true);
    try {
      _successMessage = await _userRepository.editPerfil(model);
      _requestSucces = true;
      setLoading(false);
    } catch (e) {
      _errorMessage = e.response.data['mensagem'];
      _requestSucces = false;
      setLoading(false);
    }
  }

  Future getCidades(String sigla) async {
    setLoadingCity(true);
    try {
      _cidades = await _userRepository.getCidades(sigla);
      setLoadingCity(false);
    } catch (e) {
      setLoadingCity(false);
    }
  }

  void getToken() async {
    _token = await utils.getToken();
    notifyListeners();
  }

  void clearToken() async {
    _token = await utils.clearToken();
    notifyListeners();
  }

  void changeValue(String newValue) {
    _estado = newValue;
    _city = null;
    getCidades(newValue);
    notifyListeners();
  }

  void changeCidade(String newValue) {
    _city = newValue;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setLoadingCity(bool value) {
    _loadingCity = value;
    notifyListeners();
  }
}
