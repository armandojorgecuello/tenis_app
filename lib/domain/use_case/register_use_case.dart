import 'package:app_tennis/domain/repository/user_local_repository.dart';

class RegisterUserUseCase {
  final UserLocalRepository _userRepository;

  RegisterUserUseCase({required UserLocalRepository userRepository})
    : _userRepository = userRepository;

  Future<int> registerUser({required Map<String, dynamic> user}) async {
    return await _userRepository.register(user);
  }
}
