import 'package:aqui_cliente/models/user_model.dart';
import 'package:aqui_cliente/repository/user_repository.dart';

class UserStore {
  final UserRepository _userRepository;
  UserStore(this._userRepository);

  UserModel _userModel;
  UserModel get userModel => _userModel;

  void authenticate(String email, String password) async {
    _userModel = await _userRepository.authenticate(email, password);
  }
}
