import 'package:app_tennis/domain/repository/user_local_repository.dart';

class LoginUserUseCase {
  final UserLocalRepository _userRepository;

  LoginUserUseCase({required UserLocalRepository userRepository})
    : _userRepository = userRepository;

  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    return await _userRepository.login(email, password);
  }
}
